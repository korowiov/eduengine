require 'securerandom'

module Repositories
  module AuthenticationTokens
    class Generator
      class << self
        def decrypt(account_uuid, hashed_value)
          new(
            account_uuid: account_uuid,
            hashed_value: hashed_value
          ).decrypt
        end

        def prepare_tokens(account_uuid)
          new(account_uuid: account_uuid)
            .prepare_tokens
        end
      end

      def initialize(account_uuid:, hashed_value: nil)
        @account_uuid = account_uuid
        @hashed_value = hashed_value
      end

      def decrypt
        cryptor.decrypt_and_verify(hashed_value, purpose: :auth_token)
      end

      def prepare_tokens
        raw_token = generate_raw_token
        hashed_token = cryptor
                       .encrypt_and_sign(
                         raw_token, 
                         purpose: :auth_token,
                         expires_in: 7.days
                       )

        [raw_token, hashed_token]
      end

      private

      attr_reader :account_uuid, :hashed_value

      def cryptor
        @cryptor ||=
          ActiveSupport::MessageEncryptor
          .new(crypt_key)
      end

      def crypt_key
        @crypt_key ||=
          begin
            len = ActiveSupport::MessageEncryptor.key_len

            ActiveSupport::KeyGenerator
              .new(Rails.application.secrets.secret_key_base)
              .generate_key(account_uuid, len)
          end
      end

      def generate_raw_token
        loop do
          generated_token = SecureRandom.uuid 
          unless FindQuery.new.by_authentication_token(generated_token)
            return generated_token
          end
        end
      end
    end
  end
end
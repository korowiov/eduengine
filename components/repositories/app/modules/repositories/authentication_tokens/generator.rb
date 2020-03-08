require 'securerandom'

module Repositories
  module AuthenticationTokens
    class Generator
      class << self
        def decrypt(hashed_value)
          new.decrypt(hashed_value)
        end

        def prepare_tokens
          new.prepare_tokens
        end
      end

      def decrypt(hashed_value)
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

      def cryptor
        @cryptor ||=
          ActiveSupport::MessageEncryptor
          .new(crypt_key)
      end

      def crypt_key
        @crypt_key ||=
          ENV.fetch('ENCRYPTION_KEY')
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
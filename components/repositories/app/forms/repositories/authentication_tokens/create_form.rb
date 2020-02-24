require 'securerandom'

module Repositories
  module AuthenticationTokens
    class CreateForm < Repositories::BaseForm
      properties :account, :sign_in_ip, :authentication_token
      property :account_uuid, virtual: true

      validates :account, presence: true
      validates :authentication_token, presence: true

      def initialize(*args)
        super(*args)

        loop do
          generated_token = SecureRandom.uuid 

          unless Repositories::Accounts::FetchQuery.new.by_authentication_token(generated_token)
            self.authentication_token = generated_token
            break
          end
        end
      end

      private

      def account_uuid=(value)
        super(value)
        account_resource = 
          Repositories::Accounts::FetchQuery
          .new
          .by_uuid(value)

        self.account = account_resource
      end
    end
  end
end
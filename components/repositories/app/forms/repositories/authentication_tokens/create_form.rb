require 'securerandom'

module Repositories
  module AuthenticationTokens
    class CreateForm < Repositories::BaseForm
      properties :account, :sign_in_ip, :authentication_token
      property :account_uuid, virtual: true
      property :hashed_authentication_token, virtual: true

      validates :account, presence: true
      validates :authentication_token, presence: true

      def initialize(*args)
        super(*args)
        self.authentication_token = generate_authentication_token.first
        self.hashed_authentication_token = generate_authentication_token.last
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

      def generate_authentication_token
        @generate_authentication_token ||= Generator.prepare_tokens
      end
    end
  end
end
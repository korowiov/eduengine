module Repositories
  module Accounts
    class FindQuery < Repositories::BaseQuery
      set_initial_scope Repositories::Account

      def by_credentials(email, password)
        return nil unless email.present? && password.present?

        account = scope.find_by(email: email)
        account if account&.authenticate(password)
      end

      def by_authentication_token(encrypted_token, account_uuid)
        return nil if encrypted_token.blank? || account_uuid.blank?

        authentication_token = 
          Repositories::AuthenticationTokens::Generator
          .decrypt(account_uuid, encrypted_token)

        authentication_token_record = 
          token_fetch_query_instance
          .by_authentication_token(authentication_token)

        account = authentication_token_record&.account
        if account
          account.current_authentication_token = authentication_token_record
        end

        account
      end

      def by_uuid(account_uuid)
        return nil unless account_uuid.present?

        scope.find_by(uuid: account_uuid)
      end

      private

      def token_fetch_query_instance
        @token_fetch_query_instance ||=
          Repositories::AuthenticationTokens::FindQuery.new
      end
    end
  end
end
module Repositories
  module Accounts
    class FetchQuery
      attr_reader :relation

      def initialize(relation = Repositories::Account.all)
        @relation = relation
      end

      def by_credentials(email, password)
        return nil unless email.present? && password.present?

        account = relation.find_by(email: email)
        account if account&.authenticate(password)
      end

      def by_authentication_token(authentication_token)
        return nil unless authentication_token.present?

        authentication_token_record = token_fetch_class_query.new.by_authentication_token(authentication_token)
        authentication_token_record&.account
      end

      def by_uuid(uuid)
        return nil unless uuid.present?

        relation.find_by(uuid: uuid)
      end

      private

      def token_fetch_class_query
        @token_fetch_class_query ||=
          Repositories::AuthenticationTokens::FetchQuery
      end
    end
  end
end
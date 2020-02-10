module Repositories
  module AuthenticationTokens
    class FetchQuery
      attr_reader :relation

      def initialize(relation = Repositories::AuthenticationToken.all)
        @relation = relation.includes(:account)
      end

      def by_authentication_token(authentication_token)
        return nil unless authentication_token.present?

        relation.where(authentication_token: authentication_token).first
      end
    end
  end
end
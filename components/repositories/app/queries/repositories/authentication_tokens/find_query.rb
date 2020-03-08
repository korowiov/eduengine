module Repositories
  module AuthenticationTokens
    class FindQuery
      attr_reader :relation

      def initialize(relation = Repositories::AuthenticationToken)
        @relation = relation
      end

      def by_authentication_token(authentication_token)
        return nil unless authentication_token.present?

        relation.find_by(authentication_token: authentication_token)
      end
    end
  end
end
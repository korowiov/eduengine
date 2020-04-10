module Repositories
  module AuthenticationTokens
    class FindQuery < Repositories::BaseQuery
      set_initial_scope Repositories::AuthenticationToken

      def by_authentication_token(authentication_token)
        return nil if authentication_token.blank?

        scope
          .not_expired
          .find_by(authentication_token: authentication_token)
      end
    end
  end
end
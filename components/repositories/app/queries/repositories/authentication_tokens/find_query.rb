module Repositories
  module AuthenticationTokens
    class FindQuery < Repositories::BaseQuery
      set_relation Repositories::AuthenticationToken

      class << self
        def by_authentication_token(authentication_token)
          return nil if authentication_token.blank?

          relation
            .not_expired
            .find_by(authentication_token: authentication_token)
        end
      end
    end
  end
end
module Api
  module Authentication
    module Strategies
      class AuthenticationTokenStrategy < ::Warden::Strategies::Base
        def valid?
          authentication_token.present?
        end

        def authenticate!
          account = 
            Repositories::Accounts::FetchQuery
            .new
            .by_authentication_token(authentication_token)

          account.nil? ? fail('strategies.authentication_token.failed') : success!(account)
        end

        private

        def authentication_token
          @authentication_token ||=
            request.get_header('HTTP_ACCESS_TOKEN')
        end
      end
    end
  end
end
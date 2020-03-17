module Api
  module Authentication
    module Strategies
      class AuthenticationTokenStrategy < ::Warden::Strategies::Base
        def valid?
          authentication_token.present? && account_uuid.present?
        end

        def authenticate!
          account = 
            Repositories::Accounts::FindQuery
            .by_authentication_token(authentication_token, account_uuid)

          account.nil? ? fail('strategies.authentication_token.failed') : success!(account)
        end

        private

        def authentication_token
          @authentication_token ||=
            request.get_header('HTTP_ACCESS_TOKEN')
        end

        def account_uuid
          @account_uuid ||=
            request.get_header('HTTP_UUID')
        end
      end
    end
  end
end
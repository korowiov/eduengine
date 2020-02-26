module Api
  module Authentication
    module Strategies
      class CredentialsStrategy < ::Warden::Strategies::Base
        def valid?
          email.present? && password.present?
        end

        def authenticate!
          account = 
            Repositories::Accounts::FetchQuery
            .new
            .by_credentials(email, password)

          account.nil? ? fail!('strategies.credentials.failed') : success!(account)
        end

        private

        def email
          @email ||=
            params['email']
        end

        def password
          @password ||=
            params['password']
        end
      end
    end
  end
end
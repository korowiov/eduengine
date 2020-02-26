Warden::Strategies.add(:authentication_token, Api::Authentication::Strategies::AuthenticationTokenStrategy)
Warden::Strategies.add(:credentials, Api::Authentication::Strategies::CredentialsStrategy)
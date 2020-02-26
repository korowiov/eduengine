require 'api/engine'

module Api
  module Authentication
    module Strategies
      autoload :CredentialsStrategy, 'api/authentication/strategies/credentials_strategy'
      autoload :AuthenticationTokenStrategy, 'api/authentication/strategies/authentication_token_strategy'
    end
  end
end

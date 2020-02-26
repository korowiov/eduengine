module Api
  class SessionsSerializer < Api::Patterns::Serializer
    attributes :authentication_token
  end
end
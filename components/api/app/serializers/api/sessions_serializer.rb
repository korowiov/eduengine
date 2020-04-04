module Api
  class SessionsSerializer < Api::Patterns::Serializer
    attribute :authentication_token
    attribute :uuid

    def authentication_token
      object.hashed_authentication_token
    end

    def uuid
      object.account_uuid
    end
  end
end
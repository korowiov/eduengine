module Api
  class SessionsSerializer < Api::Patterns::Serializer
    attribute :authentication_token
    attribute :uuid
    attribute :email
    attribute :nickname

    def authentication_token
      object.hashed_authentication_token
    end

    def uuid
      object.account.uuid
    end

    def email
      object.account.email
    end

    def nickname
      object.account.nickname
    end
  end
end
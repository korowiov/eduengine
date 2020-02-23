module Api
  class AccountsSerializer < Api::Patterns::Serializer
    attributes :uuid, :email, :nickname
  end
end
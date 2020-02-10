module Repositories
  class AccountSerializer < ActiveModel::Serializer
    attributes :uuid, :email, :nickname
  end
end
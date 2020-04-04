module Repositories
  class AuthenticationToken < ApplicationRecord
    attr_accessor :hashed_authentication_token

    belongs_to :account, class_name: 'Repositories::Account', 
                         foreign_key: 'account_uuid',
                         primary_key: 'uuid'

    scope :not_expired, -> { where(expired: false) }

    def expire!
      update(expired: true) unless expired
    end
  end
end

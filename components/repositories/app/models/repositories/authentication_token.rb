module Repositories
  class AuthenticationToken < ApplicationRecord
    belongs_to :account, class_name: 'Repositories::Account', 
                         foreign_key: 'account_uuid',
                         primary_key: 'uuid'
  end
end

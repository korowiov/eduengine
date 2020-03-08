module Repositories
  class Account < ApplicationRecord
    include Uuidable

    has_secure_password

    has_many :authentication_tokens, class_name: 'Repositories::AuthenticationToken', 
                                     foreign_key: 'account_uuid',
                                     primary_key: 'uuid'
  end
end

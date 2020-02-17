module Repositories
  class Account < ApplicationRecord
    include Uuidable

    has_secure_password

    has_many :authentication_tokens, class_name: 'Repositories::AuthenticationToken', 
                                     foreign_key: 'account_uuid',
                                     primary_key: 'uuid'

    def generate_authentication_token!(sign_in_ip = nil)
      Repositories::AuthenticationTokens::Create.call(
        account_uuid: uuid,
        sign_in_ip: sign_in_ip
      )
    end
  end
end

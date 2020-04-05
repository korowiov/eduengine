module Repositories
  class Account < ApplicationRecord
    attr_accessor :current_authentication_token

    include Uuidable
    ALLOWED_ACTIVE_TOKENS = 3.freeze

    has_secure_password

    has_many :authentication_tokens, -> { not_expired.order(created_at: :desc) },
                                     class_name: 'Repositories::AuthenticationToken', 
                                     foreign_key: 'account_uuid',
                                     primary_key: 'uuid'

    def expire_oldest_tokens!
      if authentication_tokens.count > ALLOWED_ACTIVE_TOKENS
        authentication_tokens
          .last(authentication_tokens.count - ALLOWED_ACTIVE_TOKENS)
          .each(&:expire!)
      end
    end
  end
end

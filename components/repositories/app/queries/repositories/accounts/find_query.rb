module Repositories
  module Accounts
    class FindQuery < Repositories::BaseQuery
      set_relation Repositories::Account

      class << self
        def by_credentials(email, password)
          return nil unless email.present? && password.present?

          account = relation.find_by(email: email)
          account if account&.authenticate(password)
        end
  
        def by_authentication_token(encrypted_token, account_uuid)
          return nil if encrypted_token.blank? || account_uuid.blank?
  
          authentication_token = 
            Repositories::AuthenticationTokens::Generator
            .decrypt(account_uuid, encrypted_token)
  
          authentication_token_record = 
            token_fetch_class_query
            .by_authentication_token(authentication_token)
  
          authentication_token_record&.account
        end
  
        def by_uuid(account_uuid)
          return nil unless account_uuid.present?

          relation.find_by(uuid: account_uuid)
        end
  
        private
  
        def token_fetch_class_query
          @token_fetch_class_query ||=
            Repositories::AuthenticationTokens::FindQuery
        end      
      end
    end
  end
end
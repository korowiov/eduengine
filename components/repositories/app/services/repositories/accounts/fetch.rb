# module Repositories
#   module Accounts
#     class Fetch
#       include Repositories::Callable

#       def initialize(**args)
#         @email = args[:email]
#         @password = args[:password]
#         @authentication_token = args[:authentication_token]
#       end

#       def call
#         FetchQuery.new.send(*action) if action.present?
#       end

#       private

#       attr_reader :email, :password, :authentication_token

#       def action
#         @action ||=
#           begin
#             if credentials?
#               [:by_credentials, email, password]
#             elsif authentication_token?  
#               [:by_authentication_token, authentication_token]
#             end
#           end
#       end

#       def credentials?
#         email.present? && password.present?
#       end

#       def authentication_token?
#         authentication_token.present?
#       end
#     end
#   end
# end
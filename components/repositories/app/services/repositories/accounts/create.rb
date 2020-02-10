# module Repositories
#   module Accounts
#     class Create
#       include Repositories::Callable

#       def call
#         return resource_errors(resource) unless resource.save

#         serialize(resource)
#       end

#       private

#       attr_reader :params

#       def resource
#         @resource ||=
#           Repositories::Account.new(
#             email: params[:email],
#             password: params[:password],
#             password_confirmation: params[:password_confirmation],
#             nickname: params[:nickname]
#           )
#       end
#     end
#   end
# end
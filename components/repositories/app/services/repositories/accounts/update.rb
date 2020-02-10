# module Repositories
#   module Accounts
#     class Update
#       include Repositories::Callable
      
#       def self.call(resource, args = {})
#         new(resource, args).call
#       end

#       def initialize(resource, args = {})
#         @resource = resource
#         @params = args
#       end

#       def call
#         return resource_errors(resource) unless resource.update(update_attributes)

#         serialize(resource)
#       end

#       private

#       attr_reader :resource, :params

#       def update_attributes
#         {}.tap do |attr|
#           attr[:email] = params[:email] if params[:email].present?
#           attr[:nickname] = params[:nickname] if params[:nickname].present?
#           if params[:password].present?
#             attr[:password] = params[:password]
#             attr[:password_confirmation] = params[:password_confirmation]
#           end
#         end
#       end
#     end
#   end
# end
module Api
  class ApplicationController < ActionController::API
    include Api::Authentication::HelperMethods
    include ::ExceptionHandler

    protected

    def render_errors(resource, http_code = 422)
      render json: resource.errors.messages, status: http_code
    end

    def render_collection(resource, serializer, context = {})
      render json: 
              Api::CollectionSerializer
              .new(resource, serializer, context)
              .call, 
             status: 200
    end
  end
end

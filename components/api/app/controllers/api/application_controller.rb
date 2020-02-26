module Api
  class ApplicationController < ActionController::API
    include Api::Authentication::HelperMethods

    protected

    def render_errors(resource, http_code = 422)
      render json: resource.errors.messages, status: http_code
    end
  end
end

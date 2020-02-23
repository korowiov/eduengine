module Api
  class ApplicationController < ActionController::API
    # protect_from_forgery with: :exception

    protected

    def render_errors(resource, http_code = 422)
      render json: resource.errors.messages, status: http_code
    end
  end
end

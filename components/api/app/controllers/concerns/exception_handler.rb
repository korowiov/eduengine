module ExceptionHandler
  extend ActiveSupport::Concern

  class InvalidResourceParams < StandardError; end

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :code_404
    rescue_from ActiveRecord::RecordInvalid, with: :code_422
    rescue_from ExceptionHandler::InvalidResourceParams, with: :code_400
  end

  private

  def code_400(e)
    render json: { message: e.message }, status: 400
  end

  def code_404(e)
    render json: { message: e.message }, status: 404
  end

  def code_422(e)
    render json: { message: e.message }, status: 422
  end    
end

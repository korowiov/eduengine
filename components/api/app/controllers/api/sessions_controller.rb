require_dependency 'api/authenticated_controller'

module Api
  class SessionsController < AuthenticatedController
    def create
      action = 
        Api::Sessions::Create
        .new(account_uuid: current_account&.uuid, ip: request_ip)

      if action.call
        render json: Api::SessionsSerializer.new(action.resource).serializable_hash, 
               status: 201
      end
    end

    def show
      render_object(current_account, Api::AccountsSerializer)
    end

    def destroy
      current_session&.expire!
      head :no_content
    end

    private

    def request_ip
      request.remote_addr
    end
  end
end
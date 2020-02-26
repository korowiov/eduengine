require_dependency 'api/application_controller'

module Api
  class AccountsController < ApplicationController
    def create
      action = Api::Accounts::Create.new(account_params)
      if action.call
        render json: Api::AccountsSerializer.new(action.resource).serializable_hash, 
               status: 201
      else
        render_errors(action)
      end
    end

    private

    def account_params
      params
        .permit(
          :email, 
          :nickname, 
          :password, 
          :password_confirmation
        )
    end
  end
end
require_dependency 'api/application_controller'

module Api
  class AuthenticatedController < ApplicationController
    before_action :authenticate!
  end
end
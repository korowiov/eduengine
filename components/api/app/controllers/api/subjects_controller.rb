require_dependency 'api/application_controller'

module Api
  class SubjectsController < ApplicationController
    def index
      subjects =
        Api::Subjects::Index::Action
        .call()

      render_collection(subjects, Api::SubjectsSerializer)
    end
  end
end
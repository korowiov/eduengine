require_dependency 'api/authenticated_controller'

module Api
  class ResourcesController < AuthenticatedController
    def index
      @resources = 
        Api::Resources::Index::Action
        .call(index_params)

      render_collection(@resources, Api::ResourcesSerializer)
    end

    def show
    end

    private

    def index_params
      params.permit(:limit, :offest, :sort, :education, subjects: [], types: [])
    end
  end
end
module Api
  module Resources
    module Show
      class Action
        include Api::Patterns::Services

        def initialize(resource_id)
          @resource_id = resource_id
        end

        def call
          raise ActiveRecord::RecordNotFound unless resource.present?

          resource
        end

        private

        attr_reader :resource_id

        def available_resources
          @available_resources ||=
            Api::Resources::Index::Action.call({})
        end

        def resource
          @resource ||=
            Repositories::Resources::FindQuery
            .new(available_resources)
            .by_uuid(resource_id)
        end
      end
    end
  end
end
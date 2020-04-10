module Repositories
  module Resources
    class FindQuery < Repositories::BaseQuery
      set_initial_scope Repositories::Resource

      def by_uuid(resource_uuid)
        return nil unless resource_uuid.present?

        scope.find_by(uuid: resource_uuid)
      end
    end
  end
end
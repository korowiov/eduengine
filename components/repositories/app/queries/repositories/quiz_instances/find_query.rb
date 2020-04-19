module Repositories
  module QuizInstances
    class FindQuery < Repositories::BaseQuery
      set_initial_scope Repositories::QuizInstance

      def by_uuid(quiz_instance_uuid)
        return nil unless quiz_instance_uuid.present?

        scope.find_by(uuid: quiz_instance_uuid)
      end
    end
  end
end
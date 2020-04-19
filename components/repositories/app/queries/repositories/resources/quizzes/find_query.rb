module Repositories
  module Resources
    module Quizzes
      class FindQuery < Repositories::BaseQuery
        set_initial_scope Repositories::Resources::Quiz

        def by_uuid(quiz_uuid)
          return nil unless quiz_uuid.present?

          scope
            .published
            .includes(:quiz_questions)
            .find_by(uuid: quiz_uuid)
        end
      end
    end
  end
end
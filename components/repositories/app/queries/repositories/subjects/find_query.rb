module Repositories
  module Subjects
    class FindQuery < Repositories::BaseQuery
      set_initial_scope Repositories::Subject

      def by_id(subject_id)
        return nil unless subject_id.present?

        scope.find_by(id: subject_id)
      end 

      def by_slug(slug)
        return nil unless slug.present?

        scope.find_by(slug: slug)
      end
    end
  end
end
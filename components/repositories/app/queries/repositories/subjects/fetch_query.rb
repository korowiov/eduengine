module Repositories
  module Subjects
    class FetchQuery < Repositories::BaseQuery
      set_initial_scope Repositories::Subject

      def by_ids(subject_ids)
        return scope.none unless subject_ids.present?

        scope.where(id: subject_ids)
      end

      def with_childrens(subject_ids)
        return scope.none unless subject_ids.present?

        scope
          .where(id: subject_ids)
          .or(
            scope.where(ancestry: subject_ids)
          )
      end

      def roots
        scope.roots
      end
    end
  end
end
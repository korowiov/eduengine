module Repositories
  module Subjects
    class FetchQuery < Repositories::BaseQuery
      set_relation Repositories::Subject

      class << self
        def by_ids(subject_ids)
          return relation.none unless subject_ids.present?

          relation.where(id: subject_ids)
        end
      end
    end
  end
end
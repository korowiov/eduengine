module Repositories
  module Subjects
    class FindQuery < Repositories::BaseQuery
      set_relation Repositories::Subject

      class << self
        def by_id(subject_id)
          return nil unless subject_id.present?

          relation.find_by(id: subject_id)
        end 

        def by_slug(slug)
          return nil unless slug.present?

          relation.find_by(slug: slug)
        end
      end
    end
  end
end
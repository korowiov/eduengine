module Repositories
  module Resources
    class FetchQuery < Repositories::BaseQuery
      set_relation Repositories::Resource

      class << self
        def by_newest(current_relation = nil)
          override_relation(current_relation) do
            relation.order(published_at: :desc)
          end
        end

        def by_oldest(current_relation = nil)
          override_relation(current_relation) do
            relation.order(published_at: :asc)
          end
        end

        def by_subjects(subject_ids, current_relation = nil)
          subject_ids = Array.wrap(subject_ids)

          override_relation(current_relation) do
            relation.where(subject_id: subject_ids)
          end
        end

        def by_subject_slug(subject_slug)
          subject_resource = 
            Repositories::Subjects::FindQuery
            .by_slug(subject_slug)

          return relation.none unless subject_resource.present?

          relation.where(subject: subject_resource)
        end

        def by_tags(tags, current_relation = nil)
          tags = Array.wrap(tags)

          override_relation(current_relation) do
            relation.tagged_with(tags)
          end
        end

        def by_types(types, current_relation = nil)
          types = Array.wrap(types).map(&:classify)

          override_relation(current_relation) do
            relation.where(type: types)
          end
        end

        def published
          relation
            .includes(:tags, :author, :subject, :cover_attachment)
            .published
        end
      end
    end
  end
end
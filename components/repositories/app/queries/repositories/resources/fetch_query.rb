module Repositories
  module Resources
    class FetchQuery < Repositories::BaseQuery
      set_relation Repositories::Resource

      class << self
        def all
          relation.all
        end

        def published
          relation.published
        end

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
      end
    end
  end
end
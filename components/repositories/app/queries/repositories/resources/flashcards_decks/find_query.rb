module Repositories
  module Resources
    module FlashcardsDecks
      class FindQuery < Repositories::BaseQuery
        set_initial_scope Repositories::Resources::FlashcardsDeck

        def by_uuid(resource_uuid)
          return nil unless resource_uuid.present?

          scope
            .includes(:flashcards)
            .find_by(uuid: resource_uuid)
        end
      end
    end
  end
end
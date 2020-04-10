module Repositories
  module Resources
    module FlashcardsDecks
      class FindQuery < Repositories::BaseQuery
        set_initial_scope Repositories::Resources::FlashcardsDeck

        def by_uuid(flashcard_deck_uuid)
          return nil unless flashcard_deck_uuid.present?

          scope
            .published
            .includes(:flashcards)
            .find_by(uuid: flashcard_deck_uuid)
        end
      end
    end
  end
end
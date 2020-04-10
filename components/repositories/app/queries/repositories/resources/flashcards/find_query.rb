module Repositories
  module Resources
    module Flashcards
      class FindQuery < Repositories::BaseQuery
        set_initial_scope Repositories::Resources::FlashcardsDeck

        def by_uuid(flashcard_deck_uuid, flashcard_uuid)
          return nil unless flashcard_deck_uuid.present? || flashcard_uuid.present?

          flashcard_deck =
            Repositories::Resources::FlashcardsDecks::FindQuery
            .new
            .by_uuid(flashcard_deck_uuid)

          return nil unless flashcard_deck.present?

          flashcard_deck
            .flashcards
            .find_by(uuid: flashcard_uuid)
        end
      end
    end
  end
end
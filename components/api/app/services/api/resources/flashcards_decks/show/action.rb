module Api
  module Resources
    module FlashcardsDecks
      module Show
        class Action
          include Api::Patterns::Services

          def initialize(flashcard_deck_id)
            @flashcard_deck_id = flashcard_deck_id
          end

          def call
            raise ActiveRecord::RecordNotFound unless flashcard_deck.present?

            flashcard_deck
          end

          private

          attr_reader :flashcard_deck_id

          def flashcard_deck
            @flashcard_deck ||=
              Repositories::Resources::FlashcardsDecks::FindQuery
              .new
              .by_uuid(flashcard_deck_id)
          end
        end
      end
    end
  end
end
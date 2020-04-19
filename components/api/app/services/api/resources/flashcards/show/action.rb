module Api
  module Resources
    module Flashcards
      module Show
        class Action
          include Api::Patterns::Services
        
          def initialize(flashcard_deck_id, flashcard_id)
            @flashcard_deck_id = flashcard_deck_id
            @flashcard_id = flashcard_id
          end

          def call
            raise ActiveRecord::RecordNotFound unless flashcard.present?

            flashcard
          end

          private

          attr_reader :flashcard_deck_id, :flashcard_id

          def flashcard
            @flashcard ||=
              Repositories::Flashcards::FindQuery
              .new
              .by_uuid(flashcard_deck_id, flashcard_id)
          end
        end
      end
    end
  end
end
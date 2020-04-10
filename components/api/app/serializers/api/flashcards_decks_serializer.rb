module Api
  class FlashcardsDecksSerializer < Api::Patterns::Serializer
    attributes :uuid, :name
    attribute :flashcards_count
    attribute :flashcards

    def flashcards_count
      object.associations_counter
    end

    def flashcards
      object.flashcards.map do |flashcard|
        flashcard.slice(:title, :uuid)
      end
    end
  end
end
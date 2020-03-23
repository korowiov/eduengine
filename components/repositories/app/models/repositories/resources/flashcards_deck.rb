module Repositories
  module Resources
    class FlashcardsDeck < Base
      has_many :flashcards, class_name: 'Repositories::Flashcard',
                            foreign_key: 'resource_uuid',
                            primary_key: 'uuid',
                            inverse_of: :flashcards_deck,
                            autosave: true
    end
  end
end

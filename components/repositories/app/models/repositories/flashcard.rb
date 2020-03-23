module Repositories
  class Flashcard < ApplicationRecord
    include Uuidable

    has_one_attached :front_card
    has_one_attached :back_card

    belongs_to :flashcards_deck, class_name: 'Repositories::Resources::FlashcardsDeck',
                                 foreign_key: 'resource_uuid',
                                 primary_key: 'uuid',
                                 inverse_of: :flashcards,
                                 counter_cache: :associations_counter
  end
end

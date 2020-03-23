require Repositories::Engine.root.join('app', 'models', 'repositories', 'flashcard')

module Repositories
  class Flashcard

    def flashcards_deck_enum
      Repositories::Resources::FlashcardsDeck
        .all
        .map do |flashcards_deck|
          ["Deck ##{flashcards_deck.id}", flashcards_deck.uuid]
        end
    end

    rails_admin do
      create do
        field :title
        field :resource_uuid, :enum do
          enum_method do
            :flashcards_deck_enum
          end
          label do
            'Flashcards deck'
          end
        end
        field :front
        field :front_card, :active_storage do
          label do
            'Card front image'
          end
        end
        field :back
        field :back_card, :active_storage do
          label do
            'Card back image'
          end
        end
      end

      edit do
        field :title
        field :front
        field :front_card, :active_storage do
          label do
            'Card front image'
          end
        end
        field :back
        field :back_card, :active_storage do
          label do
            'Card back image'
          end
        end
      end

      list do
        fields :id, :uuid
        field :flashcards_deck do
          pretty_value do
            "Deck ##{value.id}"
          end
        end
        fields :title
      end
    end
  end
end
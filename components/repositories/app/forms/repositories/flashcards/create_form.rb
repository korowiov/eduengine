module Repositories
  module Flashcards
    class CreateForm < Repositories::BaseForm
      properties :title, :front, :back

      validates :title, presence: true
      validates :front, presence: true
      validates :back, presence: true

      def save
        super
        increment_counter!
      end

      private

      def increment_counter!
        model.flashcards_deck.increment!(:associations_counter)
      end
    end
  end
end
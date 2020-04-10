require_dependency 'api/authenticated_controller'

module Api
  module Resources
    class FlashcardsDecksController < AuthenticatedController
      def show
        flashcards_deck =
          Api::Resources::FlashcardsDecks::Show::Action
          .call(params[:id])

        render_object(flashcards_deck, Api::FlashcardsDecksSerializer)
      end
    end
  end
end
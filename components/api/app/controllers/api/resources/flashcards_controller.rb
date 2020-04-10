require_dependency 'api/authenticated_controller'

module Api
  module Resources
    class FlashcardsController < AuthenticatedController
      def show
        flashcard =
          Api::Resources::Flashcards::Show::Action
          .call(params[:flashcards_deck_id], params[:id])

        render_object(flashcard, Api::FlashcardsSerializer)
      end
    end
  end
end
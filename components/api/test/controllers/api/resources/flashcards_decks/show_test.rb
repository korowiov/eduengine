require 'test_helper'

module ApiTests
  module ResourcesTests
    module FlashcardsDecksControllerTests
      class ShowTest < ActionDispatch::IntegrationTest
        include SharedContexts::StubSignedAccount

        let(:flashcard_deck) { create(:resource_flashcards_deck, :published) }
        let(:flashcards) { create_list(:flashcard, 10, flashcards_deck: flashcard_deck) }
        let(:flashcard_deck_id) { flashcard_deck.uuid }
        let(:make_request) do
          get "/api/resources/flashcards_decks/#{flashcard_deck_id}", headers: authentication_headers
        end

        before do
          flashcard_deck
          flashcards
        end

        describe 'Successful request' do
          let(:expected_response) do
            hsh = flashcard_deck.slice(:uuid, :name)
            hsh[:flashcards_count] = flashcard_deck.associations_counter
            hsh[:flashcards] = flashcards.map{ |f| f.slice(:title, :uuid) }
            hsh
          end

          it 'returns proper json' do
            make_request
            assert_equal json_response, expected_response
          end

          it 'returns 200' do
            make_request
            assert_response :ok
          end
        end
        
        describe 'Unsuccessful request' do
          describe 'Flashcard deck is not published' do
            before do
              flashcard_deck.update(status: 'draft', published_at: nil)
            end

            it 'returns 404' do
              make_request
              assert_response :not_found
            end
          end

          describe 'Flashcard deck invalid id' do
            let(:flashcard_deck_id) { 'invalid' }

            it 'returns 404' do
              make_request
              assert_response :not_found
            end
          end

          describe 'User not signed in' do
            let(:make_request) do
              get "/api/resources/flashcards_decks/#{flashcard_deck_id}"
            end

            it 'returns 401' do
              make_request
              assert_response :unauthorized
            end
          end
        end
      end
    end 
  end
end
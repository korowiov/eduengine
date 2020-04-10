require_relative 'base_test'

module ApiTests
  module ResourcesControllerTests
    module IndexTests
      class TypesTest < BaseTest
        let(:quizzes) do
          create_list(:resource, 10, :published, :random_date, type: 'Quiz', author: author)
        end

        let(:flashcards_decks) do
          create_list(:resource, 10, :published, :random_date, type: 'FlashcardsDeck', author: author)
        end

        before do
          quizzes
          flashcards_decks
        end

        describe 'Successful request' do
          describe 'Fetching quizzes' do
            let(:request_params) do
              {
                types: %w[quiz]
              }
            end

            let(:expected_json) do
              quizzes
                .map do |resource|
                  resource_jsonify(resource)
                end
            end
  
            it 'returns 200' do
              make_request
              assert_response :ok
            end
  
            it 'returns proper json' do
              make_request
              assert_equal expected_json, json_response
            end
          end

          describe 'Fetching flashcards decks' do
            let(:request_params) do
              {
                types: %w[flashcards_deck]
              }
            end

            let(:expected_json) do
              flashcards_decks
                .map do |resource|
                  resource_jsonify(resource)
                end
            end

            it 'returns 200' do
              make_request
              assert_response :ok
            end

            it 'returns proper json' do
              make_request
              assert_equal expected_json, json_response
            end
          end

          describe 'Fetching all types' do
            let(:request_params) do
              {
                types: %w[quiz flashcards_deck]
              }
            end

            let(:expected_json) do
              (quizzes | flashcards_decks)
                .map do |resource|
                  resource_jsonify(resource)
                end
            end
  
            it 'returns 200' do
              make_request
              assert_response :ok
            end
  
            it 'returns proper json' do
              make_request
              assert_equal expected_json, json_response
            end
          end
        end
      end
    end
  end
end
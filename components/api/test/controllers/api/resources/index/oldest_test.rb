require_relative 'base_test'

module ApiTests
  module ResourceControllerTests
    module IndexTests
      class OldestTest < BaseTest
        let(:draft) do
          create_list(:resource, 10, :draft, type: 'Quiz', author: author)
        end

        let(:pending) do
          create_list(:resource, 10, :pending, type: 'Quiz', author: author)
        end

        let(:published) do
          create_list(:resource, 20, :published, :random_date, type: 'Quiz', author: author)
        end 

        before do
          draft
          pending
          published
        end
        
        describe 'Successful request' do
          let(:request_params) do
            {
              sort: 'date_asc'
            }
          end

          let(:expected_json) do
            published
              .sort_by(&:published_at)
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

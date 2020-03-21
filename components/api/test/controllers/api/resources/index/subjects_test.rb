require_relative 'base_test'

module ApiTests
  module ResourceControllerTests
    module IndexTests
      class SubjectsTest < BaseTest
        let(:subject_1) { create(:subject) }
        let(:subject_1_child) { create(:subject, parent: subject_1) }
        let(:subject_2) { create(:subject) }

        let(:published_1) do
          create_list(:resource, 20, :published, :random_date, type: 'Quiz', author: author, subject: subject_1)
        end

        let(:published_2) do
          create_list(:resource, 20, :published, :random_date, type: 'Quiz', author: author, subject: subject_1_child)
        end

        let(:published_3) do
          create_list(:resource, 20, :published, :random_date, type: 'Quiz', author: author, subject: subject_2)
        end

        before do
          subject_1
          subject_1_child
          subject_2

          published_1
          published_2
          published_3
        end

        describe 'Successful request' do
          describe 'Fetching subject_1 and subject_1_child' do
            let(:request_params) do
              {
                subjects: [subject_1.id, subject_1_child.id]
              }
            end

            let(:expected_json) do
              (published_1 | published_2)
                .map do |resource|
                  resource_jsonify(resource)
                end
            end
  
            it 'returns 200' do
              make_request
              assert_response :ok
            end
  
            it 'returns proper json' do
              binding.pry
              make_request
              assert_equal expected_json, json_response
            end
          end

          describe 'Fetching subject_1_child' do
            let(:request_params) do
              {
                subjects: [subject_1_child.id]
              }
            end

            let(:expected_json) do
              published_2
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
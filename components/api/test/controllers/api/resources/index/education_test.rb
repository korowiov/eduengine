require_relative 'base_test'

module ApiTests
  module ResourcesControllerTests
    module IndexTests
      class EducationTest < BaseTest
        let(:quizzes_1) do
          create_list(:resource, 5, :published, :random_date, type: 'Quiz')
        end

        let(:quizzes_2) do
          create_list(:resource, 5, :published, :random_date, :grade_7_8, type: 'Quiz')
        end

        let(:quizzes_3) do
          create_list(:resource, 5, :published, :random_date, :grade_9_12, type: 'Quiz')
        end

        before do
          quizzes_1
          quizzes_2
          quizzes_3
        end

        describe 'successful request' do
          let(:request_params) do
            {
              education: 'grade_4_6'
            }
          end

          let(:expected_json) do
            quizzes_1
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
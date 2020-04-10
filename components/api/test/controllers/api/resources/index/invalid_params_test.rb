require_relative 'base_test'

module ApiTests
  module ResourcesControllerTests
    module IndexTests
      class InvalidParamsTest < BaseTest
        describe 'Unsuccessful request' do
          describe 'Invalid sort param value' do
            let(:request_params) do
              {
                sort: 'invalid'
              }
            end

            it 'returns 400' do
              make_request
              assert_response :bad_request
            end
          end

          describe 'Invalid types param value' do
            let(:request_params) do
              {
                types: ['invalid']
              }
            end

            it 'returns 400' do
              make_request
              assert_response :bad_request
            end
          end

          describe 'Invalid education param value' do
            let(:request_params) do
              {
                education: 'invalid'
              }
            end

            it 'returns 400' do
              make_request
              assert_response :bad_request
            end
          end

          describe 'User not signed in' do
            let(:make_request) { get '/api/resources' }

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
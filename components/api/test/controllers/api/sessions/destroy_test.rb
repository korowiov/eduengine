require 'test_helper'

module ApiTests
  module SessionsControllerTests
    class DestroyTest < ActionDispatch::IntegrationTest
      include SharedContexts::StubIncomingIp
      include SharedContexts::StubSignedAccount

      let(:make_request) { delete '/api/session', headers: authentication_headers }

      describe 'Successful request' do
        it 'sets session as expired' do
          make_request
          assert session.reload.expired
        end

        it 'returns 204' do
          make_request
          assert_response :no_content
        end
      end

      describe 'Unsuccessful request' do
        describe 'Missing authentication headers' do
          it 'returns unauthorized' do
            get '/api/session'
            assert_response :unauthorized
          end
        end

        describe 'Existing authentication tokens are expired' do
          before do
            session.expire!
          end

          it 'returns unauthorized' do
            make_request
            assert_response :unauthorized
          end 
        end
      end
    end
  end
end
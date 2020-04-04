require 'test_helper'

module ApiTests
  module SessionsControllerTests
    class ShowTest < ActionDispatch::IntegrationTest
      include SharedContexts::StubIncomingIp
      include SharedContexts::StubSignedAccount

      let(:make_request) { get '/api/session', headers: authentication_headers }

      describe 'Successful request' do
        let(:expected_json) do
          account.slice(:uuid, :email, :nickname)
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
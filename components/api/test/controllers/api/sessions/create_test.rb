require 'test_helper'

module ApiTests
  module SessionsControllerTests
    class CreateTest < ActionDispatch::IntegrationTest
      include SharedContexts::StubIncomingIp
      include SharedContexts::StubSignedAccount

      let(:params) do
        {
          email: account.email,
          password: account_password
        }
      end
      let(:make_request) { post '/api/sessions', params: params }

      before do
        stub_incoming_ip!
        Repositories::AuthenticationTokens::Generator
          .stubs(:prepare_tokens)
          .with(account.uuid)
          .returns(tokens)
      end

      describe 'Successful request' do
        let(:last_created) do
          Repositories::AuthenticationToken.last
        end

        let(:expected_response) do
          {
            'authentication_token' => tokens.last,
            'uuid' => account.uuid
          }
        end

        it 'creates new authentication token record' do
          assert_difference 'Repositories::AuthenticationToken.count', 1 do
            make_request
          end
        end

        it 'creates authentication token record for proper account and saves ip' do
          make_request

          assert_equal request_ip, last_created.sign_in_ip
          assert_equal account, last_created.account
          assert_equal tokens.first, last_created.authentication_token
        end

        it 'returns 201 code' do
          make_request
          assert_response :created
        end

        it 'returns expected response' do
          make_request
          assert_equal json_response, expected_response
        end
      end

      describe 'Unsuccessful request' do
        describe 'Invalid password' do
          before do
            params.merge!(password: 'invalid password')
          end

          it 'returns 401 code' do
            make_request
            assert_response :unauthorized
          end
        end

        describe 'Invalid nickname' do
          before do
            params.merge!(email: 'invalid@email.com')
          end

          it 'returns 401 code' do
            make_request
            assert_response :unauthorized
          end
        end
      end
    end
  end
end
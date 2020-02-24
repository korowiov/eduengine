require 'test_helper'

module RepositoriesTests
  module AuthenticationTokensTests
    module CreateFormTests
      class ValidateTest < ActiveSupport::TestCase
        let(:account) { create(:account) }
        let(:params) do
          {
            account_uuid: account.uuid,
            sign_in_ip: '127.0.0.1'
          }
        end
        let(:auth_token) { Repositories::AuthenticationToken.new }
        let(:instance) { Repositories::AuthenticationTokens::CreateForm.new(auth_token) }
        let(:method_call) { instance.validate(params) }
  
        describe 'Method call .validate' do
          describe 'Valid params' do
            it 'returns true' do
              assert method_call
            end
          end
  
          describe 'Invalid params' do
            describe 'Missing account_uuid' do
              before do
                params.merge!(account_uuid: nil)
              end
  
              it 'returns false' do
                refute method_call
              end
            end
  
            describe 'Invalid account_uuid' do
              before do
                params.merge!(account_uuid: '1234')
              end
  
              it 'returns false' do
                refute method_call
              end
            end
          end
        end
      end
    end
  end
end
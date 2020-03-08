require 'test_helper'

module RepositoriesTests
  module AuthenticationTokensTests
    module CreateFormTests
      class SaveTest < ActiveSupport::TestCase
        include SharedContexts::SetEncryptionKey

        let(:account) { create(:account) }
        let(:params) do
          {
            account_uuid: account.uuid,
            sign_in_ip: '127.0.0.1'
          }
        end
        let(:auth_token) { Repositories::AuthenticationToken.new }
        let(:instance) { Repositories::AuthenticationTokens::CreateForm.new(auth_token) }
  
        describe 'Method call .validate' do
          let(:last_created) { Repositories::AuthenticationToken.last }

          it 'returns true' do
            instance.validate(params)
            assert instance.save
          end

          it 'creates new record' do
            assert_difference 'Repositories::AuthenticationToken.count', 1 do
              instance.validate(params)
              instance.save
            end
          end

          it 'creates new record with proper attributes' do
            instance.validate(params)
            instance.save

            assert_equal params[:account_uuid], last_created.account_uuid
            assert_equal params[:sign_in_ip], last_created.sign_in_ip
            assert_not_nil last_created.authentication_token
          end
        end
      end
    end
  end
end
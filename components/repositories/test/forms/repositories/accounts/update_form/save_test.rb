require 'test_helper'

module RepositoriesTests
  module AccountsTests
    module UpdateFormTests
      class ValidateTest < ActiveSupport::TestCase
        let(:params) do
          {
            email: 'new_email@example.com',
            nickname: 'newnickname'
          }
        end
        let(:account) { create(:account) }
        let(:instance) { Repositories::Accounts::UpdateForm.new(account) }

        before do
          account
        end

        describe 'Method call .save' do
          it 'returns true' do
            instance.validate(params)

            assert instance.save
          end

          it 'update record with proper attributes' do
            instance.validate(params)
            instance.save

            assert_equal params[:email], account.reload.email
            assert_equal params[:nickname], account.reload.nickname
          end
        end
      end
    end
  end
end
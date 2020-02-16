require 'test_helper'

module RepositoriesTests
  module AccountsTests
    module CreateFormTests
      class ValidateTest < ActiveSupport::TestCase
        let(:params) do
          {
            email: 'user@example.com',
            password: '123E$asd',
            password_confirmation: '123E$asd',
            nickname: 'user'
          }
        end
        let(:account) { Repositories::Account.new }
        let(:instance) { Repositories::Accounts::CreateForm.new(account) }

        describe 'Method call .save' do
          let(:last_created) { Repositories::Account.last }

          it 'returns true' do
            instance.validate(params)

            assert instance.save
          end

          it 'creates new record' do
            assert_difference 'Repositories::Account.count', 1 do
              instance.validate(params)
              instance.save
            end
          end

          it 'creates new record with proper attributes' do
            instance.validate(params)
            instance.save

            assert_equal params[:email], last_created.email
            assert_equal params[:nickname], last_created.nickname
          end
        end
      end
    end
  end
end
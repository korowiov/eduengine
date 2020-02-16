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

        describe 'Method call .validate' do
          describe 'Valid params' do
            it 'returns true' do
              assert instance.validate(params)
            end

            describe 'Updating only nickname' do
              let(:params) do
                {
                  nickname: 'newnickname'
                }
              end

              it 'returns true' do
                assert instance.validate(params)
              end
            end

            describe 'Updating only email' do
              let(:params) do
                {
                  email: 'new_email@example.com'
                }
              end

              it 'returns true' do
                assert instance.validate(params)
              end
            end
          end

          describe 'Invalid params' do
            describe 'Empty email' do
              before do
                params.merge!(email: nil)
              end

              it 'returns false' do
                refute instance.validate(params)
              end
            end

            describe 'Invalid email' do
              before do
                params.merge!(email: 'invalid@')
              end

              it 'returns false' do
                refute instance.validate(params)
              end
            end

            describe 'Email exists in another account' do
              let(:another_account) { create(:account) }

              before do
                params.merge!(email: another_account.email)
              end

              it 'returns false' do
                refute instance.validate(params)
              end
            end

            describe 'Empty nickname' do
              before do
                params.merge!(nickname: nil)
              end

              it 'returns false' do
                refute instance.validate(params)
              end
            end
          end
        end
      end
    end
  end
end
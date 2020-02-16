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
        let(:method_call) { instance.validate(params) }

        describe 'Method call .validate' do
          describe 'Valid params' do
            it 'returns true' do
              assert method_call
            end
          end

          describe 'Invalid params' do
            describe 'Missing email' do
              before do
                params.merge!(email: nil)
              end

              it 'returns false' do
                refute method_call
              end
            end

            describe 'Invalid email' do
              before do
                params.merge!(email: 'invalid@')
              end

              it 'returns false' do
                refute method_call
              end
            end

            describe 'Duplicated email' do
              let(:another_account) { create(:account) }

              before do
                params.merge!(email: another_account.email)
              end

              it 'returns false' do
                refute method_call
              end
            end

            describe 'Missing nickname' do
              before do
                params.merge!(nickname: nil)
              end

              it 'returns false' do
                refute method_call
              end
            end            

            describe 'Missing password' do
              before do
                params.merge!(password: nil)
              end

              it 'returns false' do
                refute method_call
              end
            end

            describe 'Invalid password' do
              before do
                params.merge!(password: 'invalid')
              end

              it 'returns false' do
                refute method_call
              end
            end

            describe 'Missing password confirmation' do
              before do
                params.merge!(password_confirmation: nil)
              end

              it 'returns false' do
                refute method_call
              end
            end 

            describe 'Invalid password confirmation' do
              before do
                params.merge!(password_confirmation: 'invalid')
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
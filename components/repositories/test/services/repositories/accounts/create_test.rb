# require 'test_helper'

# module RepositoriesTests
#   module AccountsTests
#     class CreateTest < ActiveSupport::TestCase
#       let(:params) {{}}
#       let(:service_call) { 
#         Repositories::Accounts::Create.call(params)
#       }

#       describe 'Successful service call' do
#         let(:params) do
#           {
#             email: 'user@example.com',
#             password: '123E$asd',
#             password_confirmation: '123E$asd',
#             nickname: 'user'
#           }
#         end

#         let(:last_created) { Repositories::Account.last }

#         let(:expected_result) do
#           {
#             id: last_created.id,
#             email: params[:email],
#             nickname: params[:nickname]
#           }
#         end

#         it 'retuns expected result' do
#           assert_equal service_call, expected_result
#         end

#         it 'creates new record' do
#           assert_difference 'Repositories::Account.count', 1 do
#             service_call
#           end
#         end

#         it 'creates new record with proper attributes' do
#           service_call

#           assert_equal params[:email], last_created.email
#           assert last_created.password_digest.present?
#         end
#       end

#       describe 'Unsuccessful service call' do
#         describe 'Email already exists' do
#           let(:existing_account) { create(:account, email: 'user@example.com') }
#           let(:params) do
#             {
#               email: 'user@example.com',
#               password: '123E$asd',
#               password_confirmation: '123E$asd',
#               nickname: 'nickname'
#             }
#           end

#           let(:expected_error) do
#             {
#               errors: ['Email has already been taken']
#             }
#           end

#           before do
#             existing_account
#           end

#           it 'retuns expected error' do
#             assert_equal expected_error, service_call
#           end

#           it 'does not create new record' do
#             assert_no_difference 'Repositories::Account.count' do
#               service_call
#             end
#           end
#         end

#         describe 'Invalid password format' do
#           let(:params) do
#             {
#               email: 'user@example.com',
#               password: '1234Asd',
#               password_confirmation: '1234Asd',
#               nickname: 'nickname'
#             }
#           end

#           let(:expected_error) do
#             {
#               errors: ['Password is invalid']
#             }
#           end
          
#           it 'retuns expected error' do
#             assert_equal expected_error, service_call
#           end
          
#           it 'does not create new record' do
#             assert_no_difference 'Repositories::Account.count' do
#               service_call
#             end
#           end            
#         end

#         describe 'Missing password confirmation' do
#           let(:params) do
#             {
#               email: 'user@example.com',
#               password: '1234Asd#',
#               nickname: 'nickname'
#             }
#           end

#           let(:expected_error) do
#             {
#               errors: ['Password confirmation can\'t be blank']
#             }
#           end
          
#           it 'retuns expected error' do
#             assert_equal expected_error, service_call
#           end
          
#           it 'does not create new record' do
#             assert_no_difference 'Repositories::Account.count' do
#               service_call
#             end
#           end            
#         end

#         describe 'Password confirmation does not match' do
#           let(:params) do
#             {
#               email: 'user@example.com',
#               password: '1234Asd#',
#               password_confirmation: '1234',
#               nickname: 'nickname'
#             }
#           end

#           let(:expected_error) do
#             {
#               errors: ['Password confirmation doesn\'t match Password']
#             }
#           end
          
#           it 'retuns expected error' do
#             assert_equal expected_error, service_call
#           end
          
#           it 'does not create new record' do
#             assert_no_difference 'Repositories::Account.count' do
#               service_call
#             end
#           end            
#         end        
        
#         describe 'Missing nickname' do
#           let(:params) do
#             {
#               email: 'user@example.com',
#               password: '1234Asd#',
#               password_confirmation: '1234Asd#'
#             }
#           end

#           let(:expected_error) do
#             {
#               errors: ['Nickname can\'t be blank']
#             }
#           end
          
#           it 'retuns expected error' do
#             assert_equal expected_error, service_call
#           end
          
#           it 'does not create new record' do
#             assert_no_difference 'Repositories::Account.count' do
#               service_call
#             end
#           end            
#         end         
#       end
#     end
#   end
# end
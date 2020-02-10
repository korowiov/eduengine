# require 'test_helper'

# module RepositoriesTests
#   module AccountsTests
#     class UpdateTest < ActiveSupport::TestCase
#       let(:account) { create(:account) }
#       let(:params) {{}}
#       let(:service_call) { 
#         Repositories::Accounts::Update.call(account, params)
#       }

#       before do
#         account
#       end

#       describe 'Successful service call' do
#         let(:params) do
#           {
#             email: 'updated_email@example.com',
#             password: '123E$asd',
#             password_confirmation: '123E$asd',
#             nickname: 'updated nickname'
#           }
#         end 
        
#         let(:expected_result) do
#           {
#             id: account.id,
#             email: params[:email],
#             nickname: params[:nickname]
#           }
#         end
        
#         it 'retuns expected result' do
#           assert_equal expected_result, service_call
#         end

#         it 'updates account with proper attributes' do
#           service_call

#           assert_equal params[:email], account.reload.email
#           assert_equal params[:nickname], account.reload.nickname
#         end         
#       end

#       describe 'Unsuccessful service call' do
#         describe 'Password format is invalid' do
#           let(:params) do
#             {
#               password: 'Invalid',
#               password_confirmation: 'Invalid'
#             }
#           end 

#           let(:expected_result) do
#             {
#               errors: ["Password is invalid"]
#             }
#           end

#           it 'retuns expected result' do
#             assert_equal expected_result, service_call
#           end          
#         end
        
#         describe 'Missing password confirmation' do
#           let(:params) do
#             {
#               password: 'Valid#1234',
#             }
#           end 

#           let(:expected_result) do
#             {
#               errors: ['Password confirmation can\'t be blank']
#             }
#           end

#           it 'retuns expected result' do
#             assert_equal expected_result, service_call
#           end          
#         end
        
#         describe 'Password confirmation is invalid' do
#           let(:params) do
#             {
#               password: 'Valid#1234',
#               password_confirmation: 'Invalid'
#             }
#           end 

#           let(:expected_result) do
#             {
#               errors: ['Password confirmation doesn\'t match Password']
#             }
#           end

#           it 'retuns expected result' do
#             assert_equal expected_result, service_call
#           end          
#         end
        
#         describe 'Email already exists' do
#           let(:another_account) { create(:account, email: 'another@example.com') }
#           let(:params) do
#             {
#               email: another_account.email
#             }
#           end

#           let(:expected_result) do
#             {
#               errors: ['Email has already been taken']
#             }
#           end          

#           before do
#             another_account
#           end

#           it 'retuns expected result' do
#             assert_equal expected_result, service_call
#           end            
#         end

#         describe 'Nickname already exists' do
#           let(:another_account) { create(:account, nickname: 'another') }
#           let(:params) do
#             {
#               nickname: another_account.nickname
#             }
#           end

#           let(:expected_result) do
#             {
#               errors: ['Nickname has already been taken']
#             }
#           end          

#           before do
#             another_account
#           end

#           it 'retuns expected result' do
#             assert_equal expected_result, service_call
#           end            
#         end        
#       end      
#     end
#   end
# end
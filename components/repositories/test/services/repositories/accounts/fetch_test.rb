# require 'test_helper'

# module RepositoriesTests
#   module AccountsTests
#     class FetchTest < ActiveSupport::TestCase
#       let(:params) {{}}
#       let(:service_call) {
#         Repositories::Accounts::Fetch.call(params)
#       }

#       let(:account_email) { 'account@example.com'}
#       let(:account_password) { 'Pa$$2019' }
#       let(:account) { 
#         create(
#           :account, 
#           email: account_email, 
#           password: account_password, 
#           password_confirmation: account_password
#         ) 
#       }

#       before do
#         account.generate_authentication_token!
#       end

#       describe 'Successful service call' do 
#         describe 'Return user by credentials' do
#           let(:params) do
#             {
#               email: account_email,
#               password: account_password
#             }
#           end

#           it 'returns account record' do
#             assert_equal account, service_call
#           end
#         end

#         describe 'Return user by token' do
#           let(:authentication_token) {
#             account.authentication_tokens.last.authentication_token
#           }
#           let(:params) do
#             {
#               authentication_token: authentication_token
#             }
#           end

#           it 'returns account record' do
#             assert_equal account, service_call
#           end
#         end
#       end

#       describe 'Unsuccessful service call' do
#         describe 'Invalid account email' do
#           let(:params) do
#             {
#               email: 'invalid@example.com',
#               password: account_password
#             }
#           end

#           it 'returns nil' do
#             assert_nil service_call
#           end
#         end

#         describe 'Invalid account password' do
#           let(:params) do
#             {
#               email: account_email,
#               password: 'invalid'
#             }
#           end

#           it 'returns nil' do
#             assert_nil service_call
#           end
#         end

#         describe 'Invalid account authentication token' do
#           let(:params) do
#             {
#               authentication_token: 'invalid'
#             }
#           end

#           it 'returns nil' do
#             assert_nil service_call
#           end
#         end
#       end
#     end
#   end
# end
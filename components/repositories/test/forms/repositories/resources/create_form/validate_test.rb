require 'test_helper'

module RepositoriesTests
  module ResourcesTests
    module CreateFormTests
      class ValidateTest < ActiveSupport::TestCase
        let(:params) do
          {
            author_uuid: author.uuid,
            name: 'Quiz name',
            description: 'Quiz description',
            type: 'quiz'
          }
        end
        let(:author) { create(:account) }
        let(:resource) { Repositories::Resource.new }
        let(:instance) { Repositories::Resources::CreateForm.new(resource) }
        let(:method_call) { instance.validate(params) }

        describe 'Method call .validate' do
          describe 'Valid params' do
            it 'returns true' do
              assert method_call
            end
          end

          describe 'Invalid params' do
            describe 'Missing author id' do
              before do
                params.merge!(author_uuid: nil)
              end

              it 'returns false' do
                refute method_call
              end
            end

            describe 'Invalid author id' do
              before do
                params.merge!(author_uuid: 'invalid')
              end

              it 'returns false' do
                refute method_call
              end
            end

            describe 'Missing name' do
              before do
                params.merge!(name: nil)
              end

              it 'returns false' do
                refute method_call
              end
            end

            describe 'Missing description' do
              before do
                params.merge!(description: nil)
              end

              it 'returns false' do
                refute method_call
              end
            end

            describe 'Missing type' do
              before do
                params.merge!(type: nil)
              end

              it 'returns false' do
                refute method_call
              end
            end

            describe 'Empty params' do
              let(:params) {{}}

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
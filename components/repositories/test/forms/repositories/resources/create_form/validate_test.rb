require 'test_helper'

module RepositoriesTests
  module ResourcesTests
    module CreateFormTests
      class ValidateTest < ActiveSupport::TestCase
        let(:params) do
          {
            author_uuid: author.uuid,
            subject_id: subject.id,
            name: 'Quiz name',
            description: 'Quiz description',
            type: 'quiz',
            tags: %w[tag1 tag2 tag3],
            education_level: 'grade_4_6'
          }
        end
        let(:author) { create(:account) }
        let(:subject) { create(:subject) }
        let(:resource) { Repositories::Resource.new }
        let(:instance) { Repositories::Resources::CreateForm.new(resource) }
        let(:method_call) { instance.validate(params) }

        describe 'Method call .validate' do
          describe 'Valid params' do
            it 'returns true' do
              assert method_call
            end

            describe 'Flashcards deck' do
              before do
                params.merge!(type: 'flashcards_deck')
              end

              it 'returns true' do
                assert method_call
              end
            end
          end

          describe 'Invalid params' do
            describe 'Missing author uuid' do
              before do
                params.merge!(author_uuid: nil)
              end

              it 'returns false' do
                refute method_call
              end
            end

            describe 'Invalid author uuid' do
              before do
                params.merge!(author_uuid: 'invalid')
              end

              it 'returns false' do
                refute method_call
              end
            end

            describe 'Missing subject id' do
              before do
                params.merge!(subject_id: nil)
              end

              it 'returns false' do
                refute method_call
              end
            end

            describe 'Invalid subject id' do
              before do
                params.merge!(subject_id: 'invalid')
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

            describe 'Invalid tag_list - passing single string' do
              before do
                params.merge!(tags: 'invalid')
              end

              it 'returns false' do
                refute method_call
              end
            end

            describe 'Invalid tag_list - passing array with empty string' do
              before do
                params.merge!(tags: [''])
              end

              it 'returns false' do
                refute method_call
              end
            end

            describe 'Invalid education level' do
              before do
                params.merge!(education_level: 'invalid')
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
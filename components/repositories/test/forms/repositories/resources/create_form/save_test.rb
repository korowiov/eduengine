require 'test_helper'

module RepositoriesTests
  module ResourcesTests
    module CreateFormTests
      class SaveTest < ActiveSupport::TestCase
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

        describe 'Method call .save' do
          let(:last_created) { Repositories::Resource.last }

          it 'returns true' do
            instance.validate(params)
            assert instance.save
          end

          it 'creates new record' do
            instance.validate(params)

            assert_difference 'Repositories::Resource.count', 1 do
              instance.save
            end
          end

          it 'creates new record with proper attributes' do
            instance.validate(params)
            instance.save

            assert_equal params[:author_uuid], last_created.author_uuid
            assert_equal params[:name], last_created.name
            assert_equal params[:description], last_created.description
            assert_equal params[:type], last_created.type
            assert_equal params[:tags], last_created.tag_list
          end

          describe 'Flashcards deck' do
            before do
              params.merge!(type: 'flashcards_deck')
            end

            it 'creates new record with proper type' do
              instance.validate(params)
              instance.save
  
              assert_equal params[:type], last_created.type
            end
          end
        end
      end
    end
  end
end
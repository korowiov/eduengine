require 'test_helper'

module RepositoriesTests
  module FlashcardsTests
    module CreateFormTests
      class SaveTest < ActiveSupport::TestCase
        let(:params) do
          {
            title: 'Flashcard title',
            front: 'Flashcard front',
            back: 'Flashcard back'
          }
        end
        let(:author) { create(:account) }
        let(:flashcards_deck) do
          create(
            :resource_flashcards_deck, 
            author: author
          )
        end
        let(:instance) do
          Repositories::Flashcards::CreateForm
            .new(flashcards_deck.flashcards.new)
        end

        before do
          flashcards_deck
        end

        describe 'Method call .save' do
          it 'returns true' do
            instance.validate(params)
            assert instance.save
          end

          it 'creates new record Flashcard' do
            assert_difference 'Repositories::Flashcard.count', 1 do
              instance.validate(params)
              instance.save
            end
          end

          it 'increments counter cache' do
            assert_difference 'flashcards_deck.reload.associations_counter', 1 do
              instance.validate(params)
              instance.save
            end
          end
        end
      end
    end
  end
end
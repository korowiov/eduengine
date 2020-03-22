require 'test_helper'

module RepositoriesTests
  module FlashcardsTests
    module CreateFormTests
      class ValidateTest < ActiveSupport::TestCase
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
        let(:method_call) { instance.validate(params) }

        before do
          flashcards_deck
        end

        describe 'Method call .validate' do
          describe 'Valid params' do
            it 'returns true' do
              assert method_call
            end
          end

          describe 'Invalid params' do
            describe 'Missing title' do
              before do
                params.merge!(title: nil)
              end

              it 'returns false' do
                refute method_call
              end              
            end

            describe 'Missing front' do
              before do
                params.merge!(front: nil)
              end

              it 'returns false' do
                refute method_call
              end
            end

            describe 'Missing back' do
              before do
                params.merge!(back: nil)
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
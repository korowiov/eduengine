require_relative 'base_test'

module RepositoriesTests
  module QuizInstancesTests
    module CreateFormTests
      class ValidateTest < BaseTest
        let(:method_call) { instance.validate(params) }

        describe 'Method call .validate' do
          describe 'Valid params' do
            it 'returns true' do
              assert method_call
            end
          end

          describe 'Invalid params' do
            describe 'Missing account uuid' do
              before do
                params.merge!(account_uuid: nil)
              end

              it 'returns false' do
                refute method_call
              end
            end

            describe 'Invalid account uuid' do
              before do
                params.merge!(account_uuid: 'invalid')
              end

              it 'returns false' do
                refute method_call
              end
            end

            describe 'Missing quiz uuid' do
              before do
                params.merge!(quiz_uuid: nil)
              end

              it 'returns false' do
                refute method_call
              end
            end

            describe 'Invalid quiz uuid' do
              before do
                params.merge!(quiz_uuid: 'invalid')
              end

              it 'returns false' do
                refute method_call
              end
            end

            describe 'Quiz is not published' do
              before do
                quiz.update(status: 'draft')
              end

              it 'returns false' do
                refute quiz.published?
                refute method_call
              end
            end

            describe 'Resource is not quiz type' do
              let(:quiz) { create(:resource_flashcards_deck, :published) }

              it 'returns false' do
                assert quiz.published?
                refute method_call
              end
            end
          end
        end
      end
    end
  end
end
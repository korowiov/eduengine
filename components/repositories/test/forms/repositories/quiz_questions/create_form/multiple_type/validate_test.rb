require 'test_helper'

module RepositoriesTests
  module QuizQuestionsTests
    module CreateFormTests
      module MultipleTypeTests
        class ValidateTest < ActiveSupport::TestCase
          let(:params) do
            {
              question_type: 'multiple_type',
              quiz_question_options: [
                {
                  content: 'test',
                  quiz_question_answers: [
                    { content: 'test1', value: false },
                    { content: 'test2', value: false },
                    { content: 'test3', value: true },
                    { content: 'test4', value: true }
                  ]
                }
              ]
            }
          end
          let(:author) { create(:account) }
          let(:quiz) { create(:resource_quiz, author: author) }
          let(:instance) { Repositories::QuizQuestions::CreateMultipleType.new(quiz.quiz_questions.new) }
          let(:method_call) { instance.validate(params) }

          before do
            quiz
          end

          describe 'Method call .validate' do
            describe 'Valid params' do
              it 'returns true' do
                assert method_call
              end
            end

            describe 'Invalid params' do
              describe 'All answers are invalid' do
                let(:invalid_answers) do
                  [
                    { content: 'test1', value: false },
                    { content: 'test2', value: false },
                    { content: 'test3', value: false },
                    { content: 'test4', value: false }
                  ]
                end

                before do
                  params[:quiz_question_options].first.merge!(
                    quiz_question_answers: invalid_answers
                  )
                end

                it 'returns false' do
                  refute method_call
                end
              end

              describe 'Invali answers count' do
                let(:invalid_answers) do
                  [
                    { content: 'test1', value: false },
                    { content: 'test2', value: true }
                  ]
                end

                before do
                  params[:quiz_question_options].first.merge!(
                    quiz_question_answers: invalid_answers
                  )
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
end
require 'test_helper'

module RepositoriesTests
  module QuizQuestionsTests
    module CreateFormTests
      module SingleTypeTests
        class ValidateTest < ActiveSupport::TestCase
          let(:params) do
            {
              question_type: 'single_type',
              quiz_question_options: [
                {
                  content: 'test',
                  quiz_question_answers: [
                    {
                      content: 'test1',
                      value: false
                    },
                    {
                      content: 'test2',
                      value: false
                    },
                    {
                      content: 'test3',
                      value: false
                    },
                    {
                      content: 'test4',
                      value: true
                    }                                                            
                  ]
                }
              ]
            }
          end
          let(:author) { create(:account) }
          let(:quiz) { create(:resource_quiz, author: author) }
          let(:instance) { Repositories::QuizQuestions::CreateForm.new(quiz.quiz_questions.new) }
          # let(:method_call) { instance.validate(params) }
          before do
            quiz
          end

          describe 'Method call .validate' do
            describe 'Valid params' do
              it 'returns true' do
                binding.pry
                #assert method_call
              end
            end
          end          
        end
      end
    end
  end
end
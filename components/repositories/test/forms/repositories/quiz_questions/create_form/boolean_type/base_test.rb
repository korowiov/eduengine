require 'test_helper'

module RepositoriesTests
  module QuizQuestionsTests
    module CreateFormTests
      module BooleanTypeTests
        class BaseTest < ActiveSupport::TestCase
          let(:params) do
            {
              question_type: 'multiple_type',
              quiz_question_options: [
                {
                  content: 'test',
                  quiz_question_answers: [
                    { content: 'test1', value: true },
                    { content: 'test2', value: false }
                  ]
                }
              ]
            }
          end
          let(:author) { create(:account) }
          let(:quiz) { create(:resource_quiz, author: author) }
          let(:instance) { Repositories::QuizQuestions::CreateBooleanType.new(quiz.quiz_questions.new) }

          before do
            quiz
          end
        end
      end
    end
  end
end
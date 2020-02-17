require 'test_helper'

module RepositoriesTests
  module QuizQuestionsTests
    module CreateFormTests
      module MultipleTypeTests
        class BaseTest < ActiveSupport::TestCase
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

          before do
            quiz
          end
        end
      end
    end
  end
end
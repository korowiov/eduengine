require 'test_helper'

module RepositoriesTests
  module QuizQuestionsTests
    module CreateFormTests
      module SingleTypeTests
        class BaseTest < ActiveSupport::TestCase
          let(:params) do
            {
              question_type: 'single_type',
              quiz_question_options: [
                {
                  content: 'test',
                  quiz_question_answers: [
                    { content: 'test1', value: false },
                    { content: 'test2', value: false },
                    { content: 'test3', value: false },
                    { content: 'test4', value: true }
                  ]
                }
              ]
            }
          end
          let(:author) { create(:account) }
          let(:quiz) { create(:resource_quiz, author: author) }
          let(:instance) { Repositories::QuizQuestions::CreateSingleType.new(quiz.quiz_questions.new) }

          before do
            quiz
          end
        end
      end
    end
  end
end
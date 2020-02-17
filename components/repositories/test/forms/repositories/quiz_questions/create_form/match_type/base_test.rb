require 'test_helper'

module RepositoriesTests
  module QuizQuestionsTests
    module CreateFormTests
      module MatchTypeTests
        class BaseTest < ActiveSupport::TestCase
          let(:params) do
            {
              question_type: 'multiple_type',
              quiz_question_options: [
                {
                  content: 'test1',
                  quiz_question_answers: [
                    { content: 'test1', value: true }
                  ]
                },
                {
                  content: 'test2',
                  quiz_question_answers: [
                    { content: 'test2', value: true }
                  ]
                },
                {
                  content: 'test3',
                  quiz_question_answers: [
                    { content: 'test3', value: true }
                  ]
                },
                {
                  content: 'test4',
                  quiz_question_answers: [
                    { content: 'test4', value: true }
                  ]
                }
              ]
            }
          end
          let(:author) { create(:account) }
          let(:quiz) { create(:resource_quiz, author: author) }
          let(:instance) { Repositories::QuizQuestions::CreateMatchType.new(quiz.quiz_questions.new) }

          before do
            quiz
          end
        end
      end
    end
  end
end
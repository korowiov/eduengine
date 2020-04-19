require 'test_helper'

module RepositoriesTests
  module QuizInstanceAnswersTests
    module CreateFormTests
      class BaseTest < ActiveSupport::TestCase
        let(:account) { create(:account) }
        let(:quiz) { create(:resource_quiz, :published) }
        let(:quiz_question_1) do
          create(:quiz_question, quiz: quiz)
        end

        let(:quiz_question_2) do
          create(:quiz_question, :multiple_type, quiz: quiz)
        end

        let(:quiz_question_3) do
          create(:quiz_question)
        end

        let(:quiz_instance) do
          create(:quiz_instance, account: account, quiz: quiz)
        end

        let(:quiz_instance_answer) do
          Repositories::QuizInstanceAnswer.new
        end

        let(:instance) do
          Repositories::QuizInstanceAnswers::CreateForm.new(quiz_instance_answer)
        end

        let(:params) do
          {
            quiz_instance_uuid: quiz_instance.uuid
          }
        end

        before do
          quiz_instance
          quiz_question_1
          quiz_question_2
        end
      end
    end
  end
end
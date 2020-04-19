require 'test_helper'

module RepositoriesTests
  module QuizInstancesTests
    module CreateFormTests
      class BaseTest < ActiveSupport::TestCase
        let(:account) { create(:account) }
        let(:quiz) { create(:resource_quiz, :published) }
        let(:quiz_instance) { Repositories::QuizInstance.new }
        let(:instance) { Repositories::QuizInstances::CreateForm.new(quiz_instance) }

        let(:params) do
          {
            account_uuid: account.uuid,
            quiz_uuid: quiz.uuid
          }
        end

        before do
          account
          quiz
        end
      end
    end
  end
end
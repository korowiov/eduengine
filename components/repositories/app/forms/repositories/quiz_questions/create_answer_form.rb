module Repositories
  module QuizQuestions
    class CreateAnswerForm < Repositories::BaseForm
      model Repositories::QuizQuestionAnswer

      properties :content, :value
    end
  end
end
module Repositories
  module QuizQuestionOptions
    class CreateForm < Repositories::BaseForm
      properties :content
      collection :quiz_question_answers, form: ::Repositories::QuizQuestionAnswers::CreateForm,
                                         populate_if_empty: ::Repositories::QuizQuestionAnswer

      validates :content, presence: true
    end
  end
end
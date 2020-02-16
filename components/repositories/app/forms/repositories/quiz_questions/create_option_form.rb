module Repositories
  module QuizQuestions
    class CreateOptionForm < Repositories::BaseForm
      model ::Repositories::QuizQuestionOption

      properties :content
      collection :quiz_question_answers, form: ::Repositories::QuizQuestions::CreateAnswerForm,
                                         populate_if_empty: ::Repositories::QuizQuestionAnswer
    end
  end
end
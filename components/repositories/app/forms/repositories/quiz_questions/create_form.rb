module Repositories
  module QuizQuestions
    class CreateForm < Repositories::BaseForm
      model ::Repositories::QuizQuestion

      properties :question_type
      collection :quiz_question_options, form: ::Repositories::QuizQuestions::CreateOptionForm, 
                                         populate_if_empty: ::Repositories::QuizQuestionOption

      validates :question_type, inclusion: { in: %w[single_type multiple_type boolean_type match_type order_type] }
    end
  end
end
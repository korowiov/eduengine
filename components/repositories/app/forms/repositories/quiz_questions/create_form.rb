module Repositories
  module QuizQuestions
    class CreateForm < Repositories::BaseForm
      properties :question_type
      collection :quiz_question_options, form: ::Repositories::QuizQuestionOptions::CreateForm, 
                                         populate_if_empty: ::Repositories::QuizQuestionOption

      validates :question_type, inclusion: { in: %w[single_type multiple_type boolean_type match_type] }

      def save
        super
        increment_counter!
      end

      private

      def increment_counter!
        model.quiz.increment!(:associations_counter)
      end
    end
  end
end
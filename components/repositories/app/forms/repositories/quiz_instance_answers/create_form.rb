module Repositories
  module QuizInstanceAnswers
    class CreateForm < Repositories::BaseForm
      properties :quiz_instance, :quiz_question, :answer_options

      property :quiz_instance_uuid, virtual: true
      property :quiz_question_uuid, virtual: true

      validates :quiz_instance, presence: true
      validates :quiz_question, presence: true

      private

      def quiz_instance_uuid=(value)
        super(value)
        quiz_instance_resource =
          Repositories::QuizInstances::FindQuery
          .new
          .by_uuid(value)

        self.quiz_instance = quiz_instance_resource
      end

      def quiz_question_uuid=(value)
        super(value)
        quiz_question_resource =
          Repositories::QuizQuestions::FindQuery
          .new
          .by_uuid(quiz_instance&.quiz_uuid, value)

        self.quiz_question = quiz_question_resource
      end
    end
  end
end
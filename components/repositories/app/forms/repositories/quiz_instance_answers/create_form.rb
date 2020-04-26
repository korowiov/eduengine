module Repositories
  module QuizInstanceAnswers
    class CreateForm < Repositories::BaseForm
      properties :quiz_instance, :quiz_question, :answer_options

      property :quiz_instance_uuid, virtual: true
      property :quiz_question_uuid, virtual: true

      validates :quiz_instance, presence: true
      validates :quiz_question, presence: true
      validate :selected_answer_options, if: :should_validate?

      private

      def available_options_uuids
        @available_options_uuids ||=
          quiz_question.quiz_question_options.pluck(:uuid)
      end

      def available_answers_uuids
        @available_answers_uuids ||=
          quiz_question.quiz_question_options.map { |option|
            option.quiz_question_answers.pluck(:uuid)
          }.flatten
      end

      def class_validation
        ''.tap { |elements|
          elements << 'Repositories'
          elements << '::QuizInstanceAnswers'
          elements << '::Validations'
          elements << "::#{quiz_question.question_type.classify}"
        }.constantize
      end

      def extend_validation
        self.extend(class_validation)
      end

      def selected_answer_options
        extend_validation
        
        unless validation_condition_fulfilled?
          errors.add(:answer_options, :invalid)
        end
      end

      def should_validate?
        quiz_question.present? && answer_options.present?
      end

      def validation_condition_fulfilled?
        validation_conditions.inject(true) do |value, condition|
          if value
            value = condition.call
          else
            value
          end
        end
      end

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
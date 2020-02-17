module Repositories
  module QuizQuestions
		class CreateSingleType < CreateForm
      validate :simple_question_type

      private

      def simple_question_type
        errors.add(:base, :options_invalid) unless valid_options_count?
        errors.add(:base, :answers_count_invalid) unless valid_answers_count?
        errors.add(:base, :answers_value_invalid) unless valid_question_answers?
      end

      def valid_options_count?
        quiz_question_options.count == 1
      end

      def valid_answers_count?
        quiz_question_options
          .first
          .quiz_question_answers
          .count == 4
      end

      def valid_question_answers?
        quiz_question_options
          .first
          .quiz_question_answers
          .one? { |answer| answer.value == true }
      end			
    end
  end
end
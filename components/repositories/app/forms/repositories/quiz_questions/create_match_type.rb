module Repositories
  module QuizQuestions
		class CreateMatchType < CreateForm
      validate :match_question_type

      private

  		def match_question_type
        errors.add(:base, :options_invalid) unless valid_options_count?
        errors.add(:base, :answers_count_invalid) unless valid_answers_count?
        errors.add(:base, :answers_value_invalid) unless valid_question_answers?
      end

			def valid_options_count?
        quiz_question_options
          .count
          .between?(3, 5)
      end

      def valid_answers_count?
        quiz_question_options
          .all? { |option| option.quiz_question_answers.count == 1 }
      end

      def valid_question_answers?
        quiz_question_options
          .collect { |option| option.quiz_question_answers }
          .flatten
          .all? { |answer| answer.value == true }
      end
    end
  end
end
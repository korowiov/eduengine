module Repositories
  module QuizInstanceAnswers
    module Validations
      module MultipleType
        private

        def validation_conditions
          [
            -> { options_count.eql?(1) },
            -> { option.in? available_options_uuids },
            -> { (answers_count > 1) && (answers_count < 4) },
            -> { answers.all? { |answer| answer.in? available_answers_uuids} }
          ]
        end

        def options_count
          answer_options.keys.count
        end

        def option
          answer_options.keys.first.to_s
        end

        def answers_count
          answers.count
        end

        def answers
          @answers ||= 
            answer_options.values.flatten
        end
      end
    end
  end
end


module Repositories
  module QuizInstanceAnswers
    module Validations
      module SingleType
        private

        def validation_conditions
          [
            -> { options_count.eql?(1) },
            -> { option.in? available_options_uuids },
            -> { answers_count.eql?(1) },
            -> { answer.in? available_answers_uuids }
          ]
        end

        def options_count
          answer_options.keys.count
        end

        def option
          answer_options.keys.first.to_s
        end

        def answers_count
          answer_options.values.flatten.count
        end

        def answer
          answer_options.values.flatten.first
        end
      end
    end
  end
end


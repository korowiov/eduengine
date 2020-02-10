module Repositories
  module Validations
    module QuizQuestionInstanceValidation
      extend ActiveSupport::Concern

      VALIDATORS_MAP = {
        'singlechoice' => Repositories::Validators::SingleChoiceQuestionValidator,
        'multiplechoice' => Repositories::Validators::MultipleChoiceQuestionValidator,
        'booleanchoice' => Repositories::Validators::BooleanChoiceQuestionValidator,
        'matchchoice' => Repositories::Validators::MatchChoiceQuestionValidator
      }

      included do
        validates :question_type, presence: true
        VALIDATORS_MAP.each do |key, validator|
          validates_with validator, if: -> { errors.empty? && send(:question_type) == key }
        end
      end
    end
  end
end
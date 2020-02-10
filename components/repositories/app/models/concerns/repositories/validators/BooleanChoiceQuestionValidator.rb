module Repositories
  module Validators
    class BooleanChoiceQuestionValidator < ActiveModel::Validator
      def validate(resource)
        binding.pry
      end
    end
  end
end
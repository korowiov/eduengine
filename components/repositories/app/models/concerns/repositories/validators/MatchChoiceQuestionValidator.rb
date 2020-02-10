module Repositories
  module Validators
    class MatchChoiceQuestionValidator < ActiveModel::Validator
      def validate(resource)
        binding.pry
      end
    end
  end
end
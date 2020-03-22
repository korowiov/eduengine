module Repositories
  module Validations
    module SubjectValidation
      extend ActiveSupport::Concern

      included do
        validates :name, presence: true, uniqueness: true
      end
    end
  end
end
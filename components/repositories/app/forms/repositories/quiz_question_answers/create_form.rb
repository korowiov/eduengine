module Repositories
  module QuizQuestionAnswers
    class CreateForm < Repositories::BaseForm
      properties :content, :value

      validates :content, presence: true
      validates :value, inclusion: { in: [true, false] }
    end
  end
end
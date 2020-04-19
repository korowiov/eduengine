module Repositories
  module QuizInstances
    class CreateForm < Repositories::BaseForm
      properties :account, :quiz

      property :account_uuid, virtual: true
      property :quiz_uuid, virtual: true

      validates :account, presence: true
      validates :quiz, presence: true

      private

      def account_uuid=(value)
        super(value)
        account_resource = 
          Repositories::Accounts::FindQuery
          .new
          .by_uuid(value)

        self.account = account_resource
      end

      def quiz_uuid=(value)
        super(value)
        quiz_resource =
          Repositories::Resources::FindQuery
          .new(Repositories::Resources::Quiz.published)
          .by_uuid(value)

        self.quiz = quiz_resource
      end
    end
  end
end
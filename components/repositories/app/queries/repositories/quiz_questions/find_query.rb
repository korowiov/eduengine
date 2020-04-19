module Repositories
  module QuizQuestions
    class FindQuery < Repositories::BaseQuery
      set_initial_scope Repositories::QuizQuestion

      def by_uuid(quiz_uuid, quiz_question_uuid)
        return nil unless quiz_uuid.present? && quiz_question_uuid.present?

        quiz =
          Repositories::Resources::Quizzes::FindQuery
          .new
          .by_uuid(quiz_uuid)

        return nil unless quiz.present?

        quiz
          .quiz_questions
          .find_by(uuid: quiz_question_uuid)
      end
    end
  end
end
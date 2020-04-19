module Repositories
  class QuizInstanceAnswer < ApplicationRecord

    belongs_to :quiz_instance, class_name: 'Repositories::QuizInstance',
                               foreign_key: 'quiz_instance_uuid',
                               primary_key: 'uuid',
                               inverse_of: :quiz_instance_answers

    belongs_to :quiz_question, class_name: 'Repositories::QuizQuestion',
                               foreign_key: 'quiz_question_uuid',
                               primary_key: 'uuid',
                               inverse_of: :quiz_instance_answers
  end
end

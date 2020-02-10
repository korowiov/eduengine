module Repositories
  class QuizQuestion < ApplicationRecord
    include Reloadable

    has_many :quiz_question_answers, class_name: 'Repositories::QuizQuestionAnswer',
                                     foreign_key: 'quiz_question_uuid',
                                     primary_key: 'uuid',
                                     inverse_of: :quiz_question

    belongs_to :quiz_question_instance, class_name: 'Repositories::QuizQuestionInstance',
                                        foreign_key: 'quiz_question_instance_uuid',
                                        primary_key: 'uuid',
                                        inverse_of: :quiz_questions
  end
end

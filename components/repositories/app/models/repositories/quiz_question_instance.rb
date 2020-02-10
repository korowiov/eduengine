module Repositories
  class QuizQuestionInstance < ApplicationRecord
    include Reloadable

    enum question_type: {
      singlechoice: 'singlechoice',
      multiplechoice: 'multiplechoice',
      booleanchoice: 'booleanchoice',
      matchchoice: 'matchchoice'
    }

    has_many :quiz_questions, class_name: 'Repositories::QuizQuestion',
                              foreign_key: 'quiz_question_instance_uuid',
                              primary_key: 'uuid',
                              inverse_of: :quiz_question

    belongs_to :quiz, class_name: 'Repositories::Resources::Quiz',
                      foreign_key: 'resource_uuid',
                      primary_key: 'uuid'
  end
end

module Repositories
  class QuizQuestionAnswer < ApplicationRecord
    include Uuidable

    belongs_to :quiz_question_option, class_name: 'Repositories::QuizQuestionOption', 
                                      foreign_key: 'quiz_question_option_uuid',
                                      primary_key: 'uuid',
                                      inverse_of: :quiz_question_answers
  end
end

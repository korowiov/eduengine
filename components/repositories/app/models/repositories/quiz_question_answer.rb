module Repositories
  class QuizQuestionAnswer < ApplicationRecord
    include Reloadable

    belongs_to :quiz_question, class_name: 'Repositories::QuizQuestion', 
                               foreign_key: 'repositories_quiz_question_uuid',
                               primary_key: 'uuid'
  end
end

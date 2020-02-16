module Repositories
  class QuizQuestionOption < ApplicationRecord
    include Reloadable

    has_many :quiz_question_answers, class_name: 'Repositories::QuizQuestionAnswer',
                                     foreign_key: 'quiz_question_option_uuid',
                                     primary_key: 'uuid',
                                     inverse_of: :quiz_question_option,
                                     autosave: true

    belongs_to :quiz_question, class_name: 'Repositories::QuizQuestion',
                               foreign_key: 'quiz_question_uuid',
                               primary_key: 'uuid',
                               inverse_of: :quiz_question_options
  end
end

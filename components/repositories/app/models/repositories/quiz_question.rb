module Repositories
  class QuizQuestion < ApplicationRecord
    include Uuidable

    enum question_type: {
      single_type: 'single_type',
      multiple_type: 'multiple_type',
      boolean_type: 'boolean_type',
      match_type: 'match_type',
      order_type: 'order_type'
    }

    has_many :quiz_question_options, class_name: 'Repositories::QuizQuestionOption',
                                     foreign_key: 'quiz_question_uuid',
                                     primary_key: 'uuid',
                                     inverse_of: :quiz_question,
                                     autosave: true

    belongs_to :quiz, class_name: 'Repositories::Resources::Quiz',
                      foreign_key: 'resource_uuid',
                      primary_key: 'uuid',
                      counter_cache: :associations_counter
  end
end

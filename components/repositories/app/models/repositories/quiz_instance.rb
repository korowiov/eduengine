module Repositories
  class QuizInstance < ApplicationRecord
    include Uuidable

    has_many :quiz_instance_answers, class_name: 'Repositories::QuizInstanceAnswer',
                                     foreign_key: 'quiz_instance_uuid',
                                     primary_key: 'uuid',
                                     inverse_of: :quiz_instance

    belongs_to :account, class_name: 'Repositories::Account', 
                         foreign_key: 'account_uuid', 
                         primary_key: 'uuid'

    belongs_to :quiz, class_name: 'Repositories::Resources::Quiz',
                      foreign_key: 'quiz_uuid',
                      primary_key: 'uuid'
  end
end

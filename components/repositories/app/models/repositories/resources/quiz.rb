module Repositories
  module Resources
    class Quiz < Base
      has_many :quiz_question_instances, class_name: 'Repositories::QuizQuestionInstance',
                                         foreign_key: 'resource_uuid',
                                         primary_key: 'uuid'
    end
  end
end
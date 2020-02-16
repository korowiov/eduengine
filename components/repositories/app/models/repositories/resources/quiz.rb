module Repositories
  module Resources
    class Quiz < Base
      has_many :quiz_questions, class_name: 'Repositories::QuizQuestion',
                                foreign_key: 'resource_uuid',
                                primary_key: 'uuid'
    end
  end
end
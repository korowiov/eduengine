require Repositories::Engine.root.join('app', 'models', 'repositories', 'quiz_question_option')

module Repositories
  class QuizQuestionOption
    accepts_nested_attributes_for :quiz_question_answers, allow_destroy: true

    def quiz_question_enum
      Repositories::QuizQuestion
        .all
        .map do |quiz_question|
          ["Question ##{quiz_question.id}", quiz_question.uuid]
        end
    end

    rails_admin do
      create do
        field :quiz_question_uuid, :enum do
          enum_method do
            :quiz_question_enum
          end
          label do
            'Quiz question'
          end
        end
        field :content
        field :image, :active_storage
        field :quiz_question_answers
      end

      list do
        fields :id, :uuid
        field :quiz_question do
          pretty_value do
            "Question ##{value.id}"
          end
        end
        fields :content, :image
      end
    end
  end
end
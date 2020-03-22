require Repositories::Engine.root.join('app', 'models', 'repositories', 'quiz_question')

module Repositories
  class QuizQuestion

    def question_type_enum
      Repositories::QuizQuestion
        .question_types
        .map do |key, value|
          [key.gsub('_', ' '), value]
        end
    end

    rails_admin do
      create do
        field :quiz
        field :question_type, :enum do
          enum_method do
            :question_type_enum
          end
          label do
            'Question type'
          end
        end
      end

      list do
        fields :id, :uuid, :quiz
        field :question_type do
          pretty_value do
            value
              .gsub('_', ' ')
          end
        end
      end
    end
  end
end
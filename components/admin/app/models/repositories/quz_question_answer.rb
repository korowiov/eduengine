require Repositories::Engine.root.join('app', 'models', 'repositories', 'quiz_question_answer')

module Repositories
  class QuizQuestionAnswer
    def question_options_enum
      Repositories::QuizQuestionOption
        .all
        .map do |option|
          ["Question option ##{option.id}", option.uuid]
        end
    end

    rails_admin do
      create do
        field :quiz_question_option_uuid, :enum do
          enum_method do
            :question_options_enum
          end
          label do
            'Question option'
          end
        end
        field :content
        field :image, :active_storage
        field :value
      end

      list do
        fields :id, :uuid
        field :quiz_question_option do
          pretty_value do
            "Question option ##{value.id}"
          end
        end
        fields :content, :image, :value
      end
    end
  end
end
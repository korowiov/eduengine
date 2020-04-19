FactoryBot.define do
  factory :quiz_question_answer, class: Repositories::QuizQuestionAnswer do
    content { 'answer' }
    value { true }

    trait :incorrect do
      value { false }
    end
  end
end
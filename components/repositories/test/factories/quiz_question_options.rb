FactoryBot.define do
  factory :quiz_question_option, class: Repositories::QuizQuestionOption do
    content { 'question content' }

    trait :single_correct do
      quiz_question_answers {[
        build(:quiz_question_answer),
        build(:quiz_question_answer, :incorrect),
        build(:quiz_question_answer, :incorrect),
        build(:quiz_question_answer, :incorrect)
      ]}
    end

    trait :multiple_correct do
      quiz_question_answers {[
        build(:quiz_question_answer),
        build(:quiz_question_answer),
        build(:quiz_question_answer, :incorrect),
        build(:quiz_question_answer, :incorrect)
      ]}
    end
  end
end
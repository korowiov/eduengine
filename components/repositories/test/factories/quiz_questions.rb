FactoryBot.define do
  factory :quiz_question, class: Repositories::QuizQuestion do
    quiz { create(:resource_quiz, :published) }
    question_type { 'single_type' }
    quiz_question_options {[
      build(:quiz_question_option, :single_correct)
    ]}

    trait :multiple_type do
      question_type { 'multiple_type' }
      quiz_question_options {[
        build(:quiz_question_option, :multiple_correct)
      ]}
    end
  end
end
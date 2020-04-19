FactoryBot.define do
  factory :quiz_instance, class: Repositories::QuizInstance do
    account { create(:account) }
    quiz { create(:resource_quiz, :published) }
  end
end
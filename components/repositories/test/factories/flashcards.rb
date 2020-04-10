FactoryBot.define do
  factory :flashcard, class: Repositories::Flashcard do
    sequence(:title) { |n| "Flashcard title #{n}" }
    sequence(:front) { |n| "Flashcard front #{n}" }
    sequence(:back) { |n| "Flashcard back #{n}" }
  end
end
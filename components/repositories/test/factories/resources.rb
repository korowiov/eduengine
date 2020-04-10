FactoryBot.define do
  factory :resource, class: Repositories::Resource do
    sequence(:name) { |n| "Resource name #{n}" }
    description { 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ut turpis ut mi facilisis molestie.' }
    author { create(:account) }
    subject { create(:subject) }
    sequence(:tag_list) { |n| ["tag#{n}"] }
    education_level { 'grade_4_6' }

    trait :draft do
      status { 'draft' }
    end

    trait :pending do
      status { 'pending' }
    end

    trait :published do
      status { 'published' }
      published_at { Time.now }
    end

    trait :revoked do
      status { 'revoked' }
    end

    trait :grade_7_8 do
      education_level { 'grade_7_8' }
    end

    trait :grade_9_12 do
      education_level { 'grade_9_12' }
    end    

    trait :random_date do
      published_at { Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)) }
    end

    factory :resource_quiz, class: Repositories::Resources::Quiz do
      type { 'Quiz' }
    end

    factory :resource_flashcards_deck, class: Repositories::Resources::FlashcardsDeck do
      type { 'FlashcardsDeck' }
    end
  end
end
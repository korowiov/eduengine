FactoryBot.define do
  factory :resource, class: Repositories::Resource do
    sequence(:name) { |n| "Resource name #{n}" }
    author { create(:account) }
    subject { create(:subject) }

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

    trait :random_date do
      published_at { Time.at(rand((Time.now - (60*60*24*365*5))..Time.now)) }
    end

    factory :resource_quiz, class: Repositories::Resources::Quiz do
      type { 'Quiz' }
    end
  end
end
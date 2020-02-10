FactoryBot.define do
  factory :account, class: Repositories::Account do
    sequence(:email) { |n| %(test#{n}@example.com) }
    password { 'T#est1234' }
    password_confirmation { 'T#est1234' }
    sequence(:nickname) { |n| %(nickname#{n}) }
  end
end
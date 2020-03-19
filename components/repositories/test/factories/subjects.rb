FactoryBot.define do
  factory :subject, class: Repositories::Subject do
    sequence(:name) { |n| "Resource name #{n}" }
  end
end
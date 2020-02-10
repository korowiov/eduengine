FactoryBot.define do
  factory :resource do
    author { create(:account) }
    sequence(:name) { |n| "Resource name #{n}" }

    factory :resource_quiz, class: Repositories::Resources::Quiz do
      type { 'Quiz' }

      quiz_instances { create_list(:quiz_instaces, 3) }
    end
  end
end
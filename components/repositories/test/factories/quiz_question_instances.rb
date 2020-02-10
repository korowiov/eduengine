FactoryBot.define do
  factory :quiz_question_instance do
    
    trait :singlechoice do
      question_type { 'singlechoice' }
    end

    trait :multiplechoice do
      question_type { 'multiplechoice' }
    end

    trait :booleanchoice do
      question_type { 'booleanchoice' }
    end

    trait :matchchoice do
      question_type { 'matchchoice' }
    end
  end
end
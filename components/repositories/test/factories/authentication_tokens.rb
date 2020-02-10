FactoryBot.define do
  factory :authentication_token, class: Repositories::AuthenticationToken do
    account { create(:account) }
    sequence(:authentication_token) { |n| %(123-123#{n}) } 
    sign_in_ip { '0.0.0.1' }
  end
end
FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }

    factory :user1 do
      handle_name { 'My Handle Name' }
    end

    factory :user_new do
    end
  end
end
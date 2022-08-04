FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user-#{n}name" }
    sequence(:email) { |n| "user-#{n}@test.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
FactoryBot.define do
  factory :tacacs_user do
    sequence(:username) { |n| "user-#{n}name" }
    password { "password" }
    user
  end
end
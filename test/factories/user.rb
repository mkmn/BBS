FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "admin#{n}" }
    password "password"
    password_confirmation "password"
  end
end

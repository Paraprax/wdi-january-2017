FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end

  trait :no_confirm do
    password_confirmation nil
  end

  trait :email_no_sequence do
    email "test@example.com"
  end
end

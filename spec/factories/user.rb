FactoryGirl.define do

  factory :user do
    sequence(:name)    { |n| "Person#{n}" }
    sequence(:email)   { |n| "person_#{n}@example.com" }

    password "foobartoo"
    password_confirmation "foobartoo"

    trait :admin do
      admin true
    end

    factory :admin, traits: [:admin]
  end
end

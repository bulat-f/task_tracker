FactoryGirl.define do
  factory :task do
    title 'Title'
    description 'Deacription'
    association :creater,   factory: :user
    association :performer, factory: :user
    project

    trait :queue do
      state 1
    end

    trait :assigned do
      state 2
    end

    trait :performed do
      state 3
    end

    trait :checked do
      state 4
    end

    trait :ready do
      state 5
    end

    trait :closed do
      state 6
    end

    factory :queue_task,     traits: [:queue]
    factory :assigned_task,  traits: [:assigned]
    factory :performed_task, traits: [:performed]
    factory :checked_task,   traits: [:checked]
    factory :ready_task,     traits: [:ready]
    factory :closed_task,    traits: [:closed]
  end
end

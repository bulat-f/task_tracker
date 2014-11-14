FactoryGirl.define do
  factory :project do
    title 'Title'
    description 'Deacription'
    association :creater, factory: :user
  end
end

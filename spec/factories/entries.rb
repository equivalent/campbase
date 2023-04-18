FactoryBot.define do
  factory :entry do
    association :creator, factory: :user
    association :project
    association :entryable, factory: :comment

    trait :with_event do
      association :entryable, factory: :event
    end
  end
end

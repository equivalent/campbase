FactoryBot.define do
  factory :event do
    occasion { "project_opened" }

    trait :project_closed do
      occasion { "project_closed" }
    end
  end
end

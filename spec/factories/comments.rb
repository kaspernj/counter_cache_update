FactoryBot.define do
  factory :comment do
    association :resource, factory: :task
    sequence(:content) { |n| "Comment #{n}" }
  end
end

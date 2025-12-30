FactoryBot.define do
  factory :comment do
    resource { association(:task) }
    sequence(:content) { |n| "Comment #{n}" }
  end
end

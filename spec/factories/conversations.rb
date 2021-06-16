FactoryBot.define do
  factory :conversation do
    association :user
    association :user, factory: :user2
  end
end

FactoryBot.define do
  factory :message do
    body {"message"}
    read {false}
    association :user
    association :user, factory: :user2
    association :conversation
  end
end
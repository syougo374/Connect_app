FactoryBot.define do
  factory :message do
    body {"message"}
    read {false}
    association :user
    association :conversation
  end
end
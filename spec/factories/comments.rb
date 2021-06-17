FactoryBot.define do
  factory :comment do
    content {'comment1'}
    association :user

  end
end
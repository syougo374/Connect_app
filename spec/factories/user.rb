FactoryBot.define do
  factory :user do
    name {'鶴野'}
    email {'syougo@docomo.ne.jp'}
    password {'password'}
    admin {true}
  end
  factory :user2 ,class: User do
    name {'syougo'}
    email {'syougo2@docomo.ne.jp'}
    password {'password2'}
    admin {false}
  end
end
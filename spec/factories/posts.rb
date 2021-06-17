FactoryBot.define do
  factory :post do
    title {'阿蘇山'}
    content {'コンテント'}
    address {'熊本県天草市'}
    # association :user
  end
  factory :post2,class: Post do
    title {'スカイツリー'}
    content {'コンテント2'}
    address {'東京都渋谷区'}
    association :user, factory: :user2
  end
  factory :post3,class: Post do
    title {'北海道'}
    content {'コンテント3'}
    address {'北海道函館'}
    association :user, factory: :user3
  end
end

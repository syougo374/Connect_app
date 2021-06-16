user1 = User.create!(
  name: "Nujabes girl",
  email: "test@docomo.com",
  password: "password",
  admin: true,
  image: File.open("app/assets/images/16083C3F-3C68-404A-AAE9-E42169BFDCBB_1_105_c.jpeg"),
)

user2 = User.create!(
  name: "tsuru",
  email: "test2@docomo.com",
  password: "password",
  image: File.open("app/assets/images/B8C5C614-41A0-4529-9644-6F354FE151E4_1_105_c.jpeg"),
)

user3 = User.create!(
  name: "miemie",
  email: "test3@docomo.com",
  password: "password",
  image: File.open("app/assets/images/B8C5C614-41A0-4529-9644-6F354FE151E4_1_105_c.jpeg"),
)
user4 = User.create!(
  name: "くまモン",
  email: "test4@docomo.com",
  password: "password",
  image: File.open("app/assets/images/__B__400x400.jpeg"),
)
user5 = User.create!(
  name: "空じろう",
  email: "test5@docomo.com",
  password: "password",
  image: File.open("app/assets/images/1280x1024_01.jpeg"),
)

post1_1 = Post.create!(
  title: "自然豊か！！",
  content: "壮大な自然が広がっている",
  address: "熊本県上益城郡山都町",
  image: File.open("app/assets/images/spot-kumamoto-kumamoto_10-2.jpeg"),
  user_id: user1.id,
)
post1_2 = Post.create!(
  title: "ゆっくりしませんか？",
  content: "動物たちが可愛い！！！",
  address: "熊本県阿蘇郡西原村",
  image: File.open("app/assets/images/spot-kumamoto-kumamoto_12.jpeg"),
  user_id: user1.id,
)
#------------

post2_1 = Post.create!(
  title: "熊本城",
  content: "熊本城です！！絶景です！",
  address: "熊本県熊本市中央区",
  image: File.open("app/assets/images/spot-kumamoto-kumamoto_01.jpeg"),
  user_id: user2.id,
)
post2_2 = Post.create!(
  title: "阿蘇の自然が凄くいい！",
  content: "自然が凄く綺麗で心がリフレッシュされます♪",
  address: "熊本県阿蘇郡南阿蘇村",
  image: File.open("app/assets/images/spot-kumamoto-kumamoto_08.jpeg"),
  user_id: user2.id,
)

post3_1 = Post.create!(
  title: "レトロな銭湯",
  content: "レトロな感じに凄く惹かれる！！店主のおじちゃんが凄く優しくて面白い！！",
  address: "三重県伊賀市",
  image: File.open("app/assets/images/f0097493_2330448.jpeg"),
  user_id: user3.id,
)
post3_2 = Post.create!(
  title: "たこ焼きミルク",
  content: "夫婦で仲良くたこ焼きを作られていて凄く和む",
  address: "三重県名張市",
  image: File.open("app/assets/images/8D88EB9F-6E51-447A-B5F0-9160AA2967B1_1_105_c.jpeg"),
  user_id: user3.id,
)
post4_1 = Post.create!(
  title: "奈良公園",
  content: "奈良公園には鹿がいっぱい！！かわいい🌟",
  address: "奈良県奈良市",
  image: File.open("app/assets/images/nara001.jpeg"),
  user_id: user4.id,
)
post4_2 = Post.create!(
  title: "富士山！！！",
  content: "やっぱり富士山は良いものだ♪",
  address: "静岡県静岡市",
  image: File.open("app/assets/images/picture_pc_70eaf3f95256cc94be55f36e2cfa6159.jpeg"),
  user_id: user4.id,
)
post5_1 = Post.create!(
  title: "綺麗な京都の街並み",
  content: "街並みがきれいです！！是非きてください！！",
  address: "京都府京都市",
  image: File.open("app/assets/images/20210124_kyoto-kanko_017.jpeg"),
  user_id: user5.id,
)
post5_2 = Post.create!(
  title: "草津温泉",
  content: "一度はきてみて草津の温泉♨️",
  address: "群馬県群馬市",
  image: File.open("app/assets/images/gunma.jpeg"),
  user_id: user5.id,
)
Favorite.create!(
  [
    # user1
    {user_id: user1.id, post_id: post2_1.id},
    {user_id: user1.id, post_id: post3_1.id},
    # user2
    {user_id: user2.id, post_id: post3_2.id},
    {user_id: user2.id, post_id: post4_1.id},
    # user3
    {user_id: user3.id, post_id: post4_2.id},
    {user_id: user3.id, post_id: post5_1.id},
    # user4
    {user_id: user4.id, post_id: post5_2.id},
    {user_id: user4.id, post_id: post1_1.id},
    # user5
    {user_id: user5.id, post_id: post1_1.id},
    {user_id: user5.id, post_id: post2_2.id},
  ]
)
# フォロー/フォロワー
Relationship.create!(
  [
    {follower_id: user1.id, followed_id: user2.id},
    {follower_id: user1.id, followed_id: user3.id},
    {follower_id: user1.id, followed_id: user5.id},
    {follower_id: user2.id, followed_id: user1.id},
    {follower_id: user2.id, followed_id: user4.id},
    {follower_id: user2.id, followed_id: user5.id},
    {follower_id: user3.id, followed_id: user1.id},
    {follower_id: user3.id, followed_id: user2.id},
    {follower_id: user3.id, followed_id: user5.id},
    {follower_id: user4.id, followed_id: user3.id},
    {follower_id: user4.id, followed_id: user5.id},
    {follower_id: user4.id, followed_id: user1.id},
    {follower_id: user5.id, followed_id: user3.id},
    {follower_id: user5.id, followed_id: user4.id},
    {follower_id: user5.id, followed_id: user1.id},
  ]
)
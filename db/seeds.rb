user1 = User.create!(
  name: "Nujabes girl",
  email: "taest@example.com",
  password: "password",
  image: File.open("app/assets/images/16083C3F-3C68-404A-AAE9-E42169BFDCBB_1_105_c.jpeg"),
)
post1_1 = Post.create!(
  title: "自然豊か！！",
  content: "壮大な自然が広がっている",
  address: "熊本県上益城郡山都町長原",
  image: File.open("app/assets/images/spot-kumamoto-kumamoto_10-2.jpeg"),
  user_id: user1.id,
)
post1_2 = Post.create!(
  title: "ゆっくりしませんか？",
  content: "動物たちが可愛い！！！",
  address: "熊本県阿蘇郡西原村河原3944-1",
  image: File.open("app/assets/images/spot-kumamoto-kumamoto_12.jpeg"),
  user_id: user1.id,
)
#------------
user2 = User.create!(
  name: "tsuru",
  email: "taest2@example.com",
  password: "password",
  image: File.open("app/assets/images/B8C5C614-41A0-4529-9644-6F354FE151E4_1_105_c.jpeg"),
)
post2_1 = Post.create!(
  title: "熊本城",
  content: "熊本城です！！絶景です！",
  address: "熊本県熊本市中央区本丸1-1",
  image: File.open("app/assets/images/spot-kumamoto-kumamoto_01.jpeg"),
  user_id: user2.id,
)
post2_2 = Post.create!(
  title: "阿蘇の自然が凄くいい！",
  content: "自然が凄く綺麗で心がリフレッシュされます♪",
  address: "熊本県阿蘇郡南阿蘇村河陽5579-3
  ",
  image: File.open("app/assets/images/spot-kumamoto-kumamoto_08.jpeg"),
  user_id: user2.id,
)
user3 = User.create!(
  name: "miemie",
  email: "taest3@example.com",
  password: "password",
  image: File.open("app/assets/images/B8C5C614-41A0-4529-9644-6F354FE151E4_1_105_c.jpeg"),
)
post3_1 = Post.create!(
  title: "レトロな銭湯",
  content: "レトロな感じに凄く惹かれる！！店主のおじちゃんが凄く優しくて面白い！！",
  address: "三重県伊賀市上野西日南町１７６２",
  image: File.open("app/assets/images/f0097493_2330448.jpeg"),
  user_id: user3.id,
)
post3_2 = Post.create!(
  title: "たこ焼きミルク",
  content: "夫婦で仲良くたこ焼きを作られていて凄く和む",
  address: "三重県名張市すずらん台西１番町２３８
  ",
  image: File.open("app/assets/images/8D88EB9F-6E51-447A-B5F0-9160AA2967B1_1_105_c.jpeg"),
  user_id: user3.id,
)

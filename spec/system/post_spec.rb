require 'rails_helper'
RSpec.describe '投稿管理機能', type: :system do
  let!(:user) {FactoryBot.create(:user)}
  let!(:user2) {FactoryBot.create(:user2)}
  let!(:post) {FactoryBot.create(:post, user: user)}
  let!(:post2) {FactoryBot.create(:post2, user: user2)}
  let!(:post3) {Post.create(title: '北海道',content: 'コンテント', address: '熊本県天草市' ,user_id: user2.id)} 
  let!(:favorite){FactoryBot.create(:favorite, post_id: post3.id, user_id: user.id)}

  before do
    visit root_path
    click_link 'ログイン'
    fill_in 'user[email]',with: 'syougo@docomo.ne.jp'
    fill_in 'user[password]',with: 'password'
    click_button 'commit'
  end

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        click_link '新規投稿'
        expect(current_path).to have_content '/posts/new'
        fill_in 'post[title]',with: '確認用タイトル'
        fill_in 'post[content]', with: '確認用コンテント'
        fill_in 'post[address]', with: '確認用住所'
        click_button 'commit'
        sleep(0.5)
        expect(page).to have_content '確認用タイトル'
        expect(page).to have_content '確認用コンテント'
        expect(page).to have_content '確認用住所'
      end
    end
    context 'タスク作成に失敗した場合' do
      it '画面遷移せずそのまま新規投稿画面にいること' do
        click_link '新規投稿'
        click_button 'commit'
        expect(current_path).to have_content '/posts'
      end
    end
  end
  describe 'お気に入り登録機能' do
    context 'お気に入りした場合' do
      it 'お気に入り一覧に表示される' do
        click_link 'スカイツリー'
        find('#favorite').click
        click_on 'お気に入り一覧'
        expect(current_path).to have_content "/favorites"
        expect(page).to have_content 'スカイツリー'
      end
    end
    context 'お気に入り解除した場合' do
      it 'お気に入り一覧に表示されなくなる' do
        click_link '北海道'
        expect(page).to have_content '投稿詳細'
        find('#unfavorite').click
        click_on 'お気に入り一覧'
        expect(current_path).to have_content '/favorites'
        expect(page).not_to have_content '北海道'
      end
    end
  end
  describe '投稿編集機能' do
    context '自分の投稿を編集する場合' do
      it '投稿が編集される' do
        click_on 'Myプロフィール'
        find(".sid_content").click
        click_link '投稿編集'
        # binding.irb
        expect(page).to have_content "投稿編集画面"
        fill_in "post[title]", with: '編集しましたよ'
        # wait = Selenium::WebDriver::Wait.new(:timeout => 20) 
        click_on 'commit'
        sleep(0.5)
        expect(page).to have_content "投稿詳細"
        expect(page).to have_content "編集しましたよ"
      end
    end
  end
  describe '投稿削除機能' do
    context '投稿を削除する場合' do
      it '投稿が削除できる' do
        click_on 'Myプロフィール'
        click_on '阿蘇山'
        click_on '投稿削除'
        page.driver.browser.switch_to.alert.accept
        click_on 'Myプロフィール'
        expect(page).not_to have_content '阿蘇山'
      end
    end
  end
end

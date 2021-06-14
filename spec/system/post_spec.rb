require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  let!(:user) {FactoryBot.create(:user)}
  let!(:user2) {FactoryBot.create(:user2)}

  before do
    FactoryBot.create(:post,user: user)
    FactoryBot.create(:post2,user: user2)
    visit new_user_session_path
    fill_in 'user[email]',with: 'syougo@docomo.ne.jp'
    fill_in 'user[password]',with: 'password'
    click_button 'commit'
  end

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        # binding.irb
        click_link '新規投稿'
        fill_in 'post[title]',with: '確認用タイトル'
        fill_in 'post[content]', with: '確認用コンテント'
        fill_in 'post[address]', with: '確認用住所'
        click_button 'commit'
        expect(current_path).to have_content '/posts/new'
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
        binding.irb

        # click_link 'スカイツリー'
        # click_link ''
      end
    end
  end
end

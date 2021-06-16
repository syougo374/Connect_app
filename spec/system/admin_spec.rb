require 'rails_helper'
RSpec.describe 'Admin', type: :system do

  let!(:user) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user2) }

  describe '管理者機能' do
    context '管理者の場合,' do
      it '管理者ページにアクセスできる' do
        visit root_path
        find("#log_in").click
        fill_in 'user[email]',with: 'syougo@docomo.ne.jp'
        fill_in 'user[password]', with: 'password'
        click_button 'commit'
        expect(page).to have_content 'みんなの投稿一覧'
        expect(page).to have_content 'ログインしました。'
        expect(page).to have_content '管理者画面'
        click_on '管理者画面'
        expect(current_path).to eq rails_admin_path
      end
    end
    context '管理者でない場合,' do
      it '管理者ページにはアクセスできない' do
        visit root_path
        find("#log_in").click
        fill_in 'user[email]',with: 'syougo2@docomo.ne.jp'
        fill_in 'user[password]', with: 'password2'
        click_button 'commit'
        expect(page).to have_content 'みんなの投稿一覧'
        expect(page).to have_content 'ログインしました。'
        expect(page).not_to have_content '管理者画面'
      end
    end
  end
end
require 'rails_helper'
RSpec.describe 'gest_login', type: :system do
  let(:post) { FactoryBot.create(:post) }
  describe 'ゲストログイン機能' do
    context 'ログイン画面のゲストログインボタンから,' do
      it 'ゲストユーザーログインできる' do
        visit root_path
        find('#log_in').click
        click_link 'ゲストログイン（閲覧用）'
        expect(page).to have_content 'ゲストユーザーとしてログインしました。'
      end
    end
  end
  context 'サインアップ画面のゲストログインボタンから,' do
    it 'ゲストユーザーログインできる' do
      visit root_path
      find('#sign_up').click
      click_link 'ゲストログイン（閲覧用）'
      expect(page).to have_content 'ゲストユーザーとしてログインしました。'
    end
  end
end
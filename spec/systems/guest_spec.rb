require 'rails_helper'
RSpec.describe 'guest_login', type: :system do
  let(:post) { FactoryBot.create(:post) }
  before do
    visit root_path
  end
  describe 'ゲストログイン機能' do
    context 'ログイン画面のゲストログインボタンから' do
      it 'ゲストユーザーログインできる' do
        find('#log_in').click
        click_link 'ゲストログイン（閲覧用）'
        expect(page).to have_content 'ゲストユーザーとしてログインしました。'
      end
    end
  end
  context 'サインアップ画面のゲストログインボタンから' do
    it 'ゲストユーザーログインできる' do
      find('#sign_up').click
      click_link 'ゲストログイン（閲覧用）'
      expect(page).to have_content 'ゲストユーザーとしてログインしました。'
    end
  end
  context 'ログイン画面の管理者ゲストユーザーボタンから' do
    it '管理者ゲストユーザーでログインできる' do
      find('#log_in').click
      click_link 'ゲストログイン（管理者用）'
      expect(page).to have_content 'ログインしました。(管理者ゲスト)'
    end
  end
  context 'サインアップ画面の管理者ゲストユーザーボタンから' do
    it '管理者ゲストユーザーでログインできる' do
      find('#sign_up').click
      click_link 'ゲストログイン（管理者用）'
      expect(page).to have_content 'ログインしました。(管理者ゲスト)'
    end
  end
end
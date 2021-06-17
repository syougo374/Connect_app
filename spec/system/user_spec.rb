require 'rails_helper'
RSpec.describe 'User関連機能',type: :system do
  let!(:user){create(:user)}
  before do
    visit root_path
  end
  describe 'devise関連機能' do
    context '全ての記述が正しい場合' do
      it 'サインアップできる' do
        find('#sign_up').click
        fill_in "user[name]", with: "つる"
        attach_file 'user[image]', 'app/assets/images/1280x1024_01.jpeg'
        fill_in "user[email]", with: "test@syougo.com"
        fill_in "user[password]", with: "password"
        fill_in "user[password_confirmation]", with: "password"
        click_button 'commit'
        expect(page).to have_content 'みんなの投稿一覧'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end
    context '入力漏れが合った場合' do
      it 'サインアップできない' do
        find("#sign_up").click
        click_button 'commit'
        expect(page).to have_content "ニックネームを入力してください"
        expect(page).to have_content "メールアドレスを入力してください"
        expect(page).to have_content "パスワードを入力してください"
      end
    end
    context '全ての記述が正しい場合' do
      it 'ログインできる' do
        find("#log_in").click
        fill_in 'user[email]',with: 'syougo@docomo.ne.jp'
        fill_in 'user[password]', with: 'password'
        click_button 'commit'
        expect(page).to have_content 'みんなの投稿一覧'
        expect(page).to have_content 'ログインしました。'
      end
    end
    context 'emailとpasswordが一致しない場合' do
      it 'ログインできない' do
        find("#log_in").click
        fill_in 'user[email]',with: 'syougo@docomo.ne.jp'
        fill_in 'user[password]', with: 'ミスパスワード'
        click_button 'commit'
        expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
        expect(current_path).to have_content '/users/sign_in'
      end
    end
    describe 'ログイン後' do
      context 'ログアウトした場合' do
        it  'トップページに戻りログイン状態が解除される' do
          visit root_path
          find("#log_in").click
          fill_in 'user[email]',with: 'syougo@docomo.ne.jp'
          fill_in 'user[password]', with: 'password'
          click_button 'commit'
          expect(page).to have_content 'みんなの投稿一覧'
          expect(page).to have_content 'ログインしました。'
          click_on 'ログアウト'
          expect(page)
        end
      end
    end
  end
end

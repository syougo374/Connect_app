require 'rails_helper'
RSpec.describe 'Admin', type: :system do

  let!(:user) { create(:user) }
  let!(:user2) { create(:user2) }
  let!(:post) {create(:post,user_id: user.id)}
  let!(:post2) {create(:post2,user_id: user2.id)}
  let!(:comment) {create(:comment,post_id: post2.id,user_id: user.id)}
  let!(:conversation) {create(:conversation,sender_id: user.id,recipient_id: user2.id)}
  let!(:favorite) {create(:favorite, post_id:post2.id, user_id:user.id)}
  let!(:message) {Message.create(body: "やほ",read:"false",user_id: user.id,conversation_id:conversation.id)}

  describe '管理者機能' do
    context '管理者の場合,' do
      it '管理者ページにアクセスできる' do
        visit root_path
        find("#log_in").click
        fill_in 'user[email]',with: 'syougo@docomo.ne.jp'
        fill_in 'user[password]', with: 'password'
        sleep(0.1)
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
    context 'ログイン画面の管理者ゲストユーザーボタンから' do
      it '管理者ページに遷移できる' do
        visit root_path
        find('#log_in').click
        click_link 'ゲストログイン（管理者用）'
        expect(page).to have_content 'ログインしました。(管理者ゲスト)'
        click_on '管理者画面'
        expect(current_path).to eq rails_admin_path
      end
    end
  end
  describe '管理者権限の機能確認' do
    before do
      visit root_path
      find_by_id('log_in').click
      click_link 'ゲストログイン（管理者用）'
      click_on '管理者画面'
    end
    context '管理者画面でユーザー情報編集した場合' do
      it 'ユーザー情報を編集できる' do
        find('.nav-pills').find_link('ユーザー').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(9)').find(".list-inline").find_link('編集').click
        find_by_id("user_email").set "hensyuu@docomo.ne.jp"
        click_button '保存'
        expect(page).to have_content 'ユーザーの更新に成功しました'
      end
    end
    context 'ユーザーを削除ボタンを押した場合' do
      it '指定したユーザーを削除できる' do
        find('.nav-pills').find_link('ユーザー').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(2) td:nth-child(9)').find(".list-inline").find_link('削除').click
        click_on('実行する')
        expect(page).to have_content 'ユーザーの削除に成功しました'
      end
    end
    context 'コメント編集ボタンを押す' do
      it 'コメントを編集できる' do
        find('.nav-pills').find_link('コメント').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(8)').find(".list-inline").find_link('編集').click
        find_by_id('comment_content').set "編集しましたよ〜〜〜"
        click_button '保存'
        expect(page).to have_content 'コメントの更新に成功しました'
      end
    end
    context 'コメント編集ボタンを押す' do
      it 'コメントを編集できる' do
        find('.nav-pills').find_link('コメント').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(8)').find(".list-inline").find_link('編集').click
        find_by_id('comment_content').set "編集しましたよ〜〜〜"
        click_button '保存'
        expect(page).to have_content 'コメントの更新に成功しました'
      end
    end
    context 'コメント削除ボタンを押す' do
      it 'コメントを削除できる' do
        find('.nav-pills').find_link('コメント').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(8)').find(".list-inline").find_link('削除').click
        click_on('実行する')
        expect(page).to have_content 'コメントの削除に成功しました'
      end
    end
    context 'お気に入りを削除ボタンを押す' do
      it 'お気に入り登録を削除できる' do
        find('.nav-pills').find_link('お気に入り').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(7)').find(".list-inline").find_link('削除').click
        click_on('実行する')
        expect(page).to have_content 'お気に入りの削除に成功しました'
      end
    end
    context 'メッセージ削除ボタンを押す' do
      it 'メッセージを削除できる' do
        find('.nav-pills').find_link('メッセージ').click
        find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(9)').find(".list-inline").find_link('削除').click
        click_on('実行する')
        expect(page).to have_content 'メッセージの削除に成功しました'
      end
    end
  end
end
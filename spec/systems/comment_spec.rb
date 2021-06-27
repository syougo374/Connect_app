require 'rails_helper'
RSpec.describe 'コメント機能', type: :system do
  let!(:user) {create(:user)}
  let!(:post) {create(:post,user_id: user.id)}
  let!(:post2) {create(:post2)}
  let!(:comment) {create(:comment,post_id: post2.id,user_id: user.id)}

  before do
    visit root_path
    find('#log_in').click
    fill_in :user_email, with: "#{user.email}"
    fill_in :user_password, with: "#{user.password}"
    click_button 'commit'
  end

  describe '投稿に対してコメントを投稿機能' do
    context '投稿にコメントした場合' do
      it '投稿にコメントが投稿される' do
        click_on 'スカイツリー'
        fill_in :comment_content, with: "ヤッホー"
        click_button 'commit'
        expect(page).to have_content 'コメントが投稿されました'
      end
    end
    context '投稿したコメントの削除ボタンを押した場合' do
      it 'コメントを削除できる' do
        click_on 'スカイツリー'
        expect(page).to have_content 'comment1'
        click_on '削除'
        expect(page).to have_content 'コメントが削除されました'
        expect(page).not_to have_content 'comment1'
      end
    end
    context '投稿したコメントの編集ボタンを押した場合' do
      it 'コメントを編集できる' do
        click_on 'スカイツリー'
        expect(page).to have_content 'comment1'
        click_on '編集'
        find_by_id("comment_edit_row-#{comment.id}").set('コメントを編集しました')
        click_on '更新する'
        expect(page).to have_content 'コメントを編集しました'
        expect(page).not_to have_content 'comment1'
      end
    end
  end
end

require 'rails_helper'
RSpec.describe 'メッセージ機能', type: :system do
  let!(:user) {create(:user)}
  let!(:post) {create(:post,user_id:user.id)}
  let!(:post2) {create(:post2)}
  before do
    visit root_path
    click_link 'ログイン'
    fill_in 'user[email]',with: 'syougo@docomo.ne.jp'
    fill_in 'user[password]',with: 'password'
    click_button 'commit'
  end
  describe 'メッセージ送信機能' do
    context 'メッセージを送信した場合' do
      it '送信され一覧にコメントが表示される' do
        click_on 'スカイツリー'
        find(".user_show_page").click
        sleep(0.1)
        find(".fa").click
        fill_in "message[body]", with: "こんにちはー"
        click_button 'commit'
        expect(page).to have_content '未読'
      end
    end
  end
end
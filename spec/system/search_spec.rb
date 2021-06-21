require 'rails_helper'
RSpec.describe 'search機能',type: :system do
  user = create(:user,name:'truru',email:'turu@docomo.com',password:'111111')
  post = create(:post, user_id:user.id,title:'title',content:'content',)
  post2 = create(:post2)
  post = create(:post3)

  describe '住所検索した場合' do
    context '住所検索した場合' do
      it '該当の投稿が表示される' do
        binding.irb
        visit root_path
      end
    end
  end
end
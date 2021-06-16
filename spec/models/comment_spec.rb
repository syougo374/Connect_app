require 'rails_helper'
RSpec.describe Comment, type: :model do
  describe 'commentモデル機能' do
    context 'バリデーションテスト' do
      it 'コメントが空の場合' do
        user2 = create(:user2)
        post = create(:post)
        comment = Comment.new(content: nil, user_id: user2.id, post_id: post.id)
        expect(comment).to be_invalid
      end
    end
  end
end
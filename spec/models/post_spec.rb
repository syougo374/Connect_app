require 'rails_helper'
describe '投稿モデル機能', type: :model do
  let!(:user) {create(:user)}
  let!(:post) {create(:post, user: user)}

  describe 'バリデーションテスト' do
    context 'タイトルの入力が正しい場合' do
      it '新規作成ができる' do
        expect(post).to be_valid
      end
    end
    context 'タイトルが空の場合' do
      it 'バリデーションエラーとなる' do
        post.title = ''
        expect(post).to be_invalid
      end
    end
    context 'タイトルが30文字以上の場合' do
      it 'バリデーションエラーとなる' do
        post.title = 'a'*31
        expect(post).to be_invalid
      end
    end
    context 'コンテントの入力が正しい場合' do
      it '新規作成できる' do
        expect(post).to be_valid
      end
    end
    context 'コンテントが空の場合' do
      it 'バリデーションエラーとなる' do
        post.content= ''
        expect(post).to be_invalid
      end
    end
    context 'コンテントが255文字以上の場合' do
      it 'バリデーションエラーとなる' do
        post.content = 'a'*256
        expect(post).to be_invalid
      end
    end
    context '住所が正しく入力されている場合' do
      it '新規作成ができる' do
        expect(post).to be_valid
      end
    end
    context '住所が空の場合' do
      it 'バリデーションエラーとなる' do
        post.address = ''
        expect(post).to be_invalid
      end
    end
    context '住所が50文字以上の場合' do
      it 'バリデーションエラーとなる' do
        post.address = 'a'*51
        expect(post).to be_invalid
      end
    end
  end
end
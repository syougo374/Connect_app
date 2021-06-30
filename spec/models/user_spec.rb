require 'rails_helper'

RSpec.describe 'User', type: :model do
  before do
    @user = create(:user)
  end
  describe 'ユーザーバリデーションテスト' do

    it '全て規定の記述済みの場合OK' do
      expect(@user).to be_valid
    end

    it 'ユーザー名が空の場合NG' do
      @user.name = nil
      expect(@user.valid?).to eq(false)
    end

    it 'ユーザー名が15文字以上の場合NG' do
      @user.name = 'a'*16
      expect(@user.valid?).to eq(false)
    end

    it 'メールアドレスが空の場合NG' do
      @user.email = nil
      expect(@user.valid?).to eq(false)
    end

    it 'メールアドレスが規定外の場合NG' do
      @user.email =  'gmail.com@'
      expect(@user.valid?).to eq(false)
    end

    it '重複したEメールの場合NG' do
      user_a = create(:user2)
      user_b = build(:user2)
      user_b.valid?
      expect(user_a).to be_valid
      expect(user_b.errors[:email]).to include('はすでに存在します')
    end

    it 'パスワードが６文字以下の場合NG' do
      @user.password =  '12345'
      @user.valid?
      expect(@user.errors[:password]).to include('は6文字以上で入力してください')
    end
  end
end
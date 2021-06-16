require 'rails_helper'
RSpec.describe Message, type: :model do
  let!(:user){create(:user)}
  let!(:user2){create(:user2)}
  let!(:conversation){create(:conversation, sender_id: user.id, rexipient_id: user2.id)}
  let!(:message){create(:message,user_id: user.id, conversation_id: conversation.id, body: 'ヤッホー')}

  describe 'メッセージ機能テスト' do
    context 'メッセージが正常の場合'
    it 'メッセージが作成できる' do
      expect(message).to be_valid
    end
  end
end
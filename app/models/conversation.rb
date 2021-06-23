class Conversation < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'#, dependent: :destroy
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'#, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates_uniqueness_of :sender_id, scope: :recipient_id

  scope :between, -> (sender_id,recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND  conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
  end


  def target_user(current_user)
    if sender_id == current_user.id
      User.find(recipient_id)
    elsif recipient_id == current_user.id
      User.find(sender_id)
    end
  end

  # def target_user(current_user)
    # binding.irb
    # if sender_id == current_user.id
    # if User.find(Conversation.recipient_id).present? && User.find(id: ()).blank?
      # Conversation.find(recipient_id).delete

    # if sender_id == current_user.id
    # conversation = Conversation.where(recipient_id: recipient_id)
    # conversation_id = conversation.ids.first
    # conversation = Conversation.find(conversation_id)
    

    # if sender_id == current_user.id && !conversation.recipient.nil? #senderとrecipientが存在している(削除されていない)
    #   binding.irb
    #   User.find(recipient_id)
    # elsif recipient_id == current_user.id && !conversation.sender.nil? #senderとrecipientが存在している(削除されていない)
    #   binding.irb
    #   User.find(sender_id)
    # else
    #   puts "送信者と受信者どちらかがいない状態"
      # Conversation.where()
  #   end
  # end

end


#   if User.find(recipient_id).present?
#     User.find(recipient_id)
#   else
#     User.find_by(name: "unkown_user")
#   end
# else recipient_id == current_user.id
#   User.find(sender_id)
# end
# else
#   User.find_by(name: namae)


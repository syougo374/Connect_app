# require 'rails_helper'
# RSpec.describe 'conversation', type: :system do
#   let!(:user){create(:user)}
#   let!(:user2){create(:user2)}
#   let!(:post){create(:post, user_id: user.id)}
#   let!(:post2){create(:post2, user_id: user2.id)}
# before do
#   user2
#   conversation = Conversation.create(sender_id: user.id, recipient_id: user2.id )
# end

#   describe '' do
#     context '' do
#       it '' do
#         binding.irb
#         visit new_user_session_path
#         fill_in 'user[email]',with: 'syougo@docomo.ne.jp'
#         fill_in 'user[password]',with: 'password'
#         click_button 'commit'
#         click_on 'スカイツリー'
#         click_on 'syougo'
#         find('.fa') .click
#         fill_in 'message[body]',with: 'はーい'
#         click_button 'commit'
#       end
#     end
#   end
# end
class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def admin_guest_sign_in
    guest_user = User.admin_guest
    sign_in guest_user   # ユーザーをログインさせる
    redirect_to root_path, notice: 'ログインしました。(管理者ゲスト)'
  end

end
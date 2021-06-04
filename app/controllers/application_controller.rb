class ApplicationController < ActionController::Base


  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :image_cache])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :image_cache])
  end
end

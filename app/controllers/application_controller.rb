class ApplicationController < ActionController::Base
  before_action :authenticate_account!, except: [:home]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:avatar, :email, :password, :password_confirmation, :current_password, :username)
    end
  end

  def after_sign_in_path_for(_resource)
    dashboard_path
  end

  def after_update_path_for(_resource)
    dashboard_path
  end

end

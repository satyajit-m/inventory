class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :check_user_is_admin
  before_action :set_current_user

  def authenticate_user!
    return if current_user.present?

    redirect_to  root_path, flash: { danger: "You must login to view" }
  end

  def current_user
    if session[:auth_token]
      @current_user ||= User.find_by_auth_token(session[:auth_token])
    else
      @current_user = nil
      # flash[:info] = "No User Found"

    end
  end

  def set_current_user
    User.current = current_user
  end
  
  def check_user_is_admin
    redirect_to root_path, flash: { warning: t("application.only_admin") } unless current_user.admin
  end

end

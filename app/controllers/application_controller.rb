class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_current_user

  helper_method :current_user
  helper_method :check_user_is_admin
  helper_method :check_user_access

  def authenticate_user!
    redirect_to root_path, flash: { danger: t("application.login_required") } unless @current_user.present?
  end

  def current_user
    if session[:auth_token]
      @current_user ||= User.find_by_auth_token(session[:auth_token])
    else
      @current_user = nil
    end
  end

  def set_current_user
    User.current = current_user
  end

  def check_user_is_admin
    redirect_to root_path, flash: { warning: t("application.only_admin") } unless current_user.admin
  end

  def current_user_access
    redirect_to root_path, flash: { warning: t("application.only_admin") } if current_user != @user && !current_user.admin
  end
end

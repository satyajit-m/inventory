class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :set_token_nil

  def authenticate_user!
    return if current_user.present?

    redirect_to  root_path
  end

  def current_user
    if session[:auth_token]
      print 456
      @current_user ||= User.find_by_auth_token(session[:auth_token])
    else
      print 123
      @current_user = nil
    end
  end

  private

  def set_token_nil
    User.where.not(auth_token: nil).update_all(auth_token: nil) unless session[:auth_token].present?
  end
end

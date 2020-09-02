class SessionsController < ApplicationController
  def create
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.present?
      User.generate_auth_token(:auth_token, @user)
      session[:auth_token] = @user.auth_token
      redirect_to root_path, flash: { success: 'Sign In Success' }
    else
      redirect_to root_path, flash: { danger: 'User Does not Exist' }
    end
  end

  def destroy
    session[:auth_token] = nil
    redirect_to root_path, flash: { info: 'Log Out Success' }
  end
end

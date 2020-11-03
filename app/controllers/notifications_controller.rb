class NotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_is_admin

  def index
    @notifications = Notification.sorted
  end
end

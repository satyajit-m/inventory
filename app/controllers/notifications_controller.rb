class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = Notification.order(created_at: :DESC).where(receiver: current_user)
  end
end

class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    if current_user.admin
      stream_from "notifications_channel_admin"
    else
      stream_from "notifications_channel_#{current_user.id}"
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
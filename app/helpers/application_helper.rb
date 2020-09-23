module ApplicationHelper
  def admin_user
    User.where(admin: true)
  end

  def notification_count
    Notification.where(receiver_id: User.current.id, read_at: nil).count
  end
end

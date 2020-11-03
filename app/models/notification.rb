class Notification < ApplicationRecord
  belongs_to :receiver, class_name: "User"
  belongs_to :sender, class_name: "User"
  belongs_to :notifiable, polymorphic: true

  scope :unread, -> { where(read_at: nil) }
  scope :sorted, -> { order(created_at: :DESC).where(receiver_id: User.current) }

  def self.low_items(item, priority)
    type = priority == "high" ?
           "danger" :
           "warning"
    msg =  priority == "high" ?
           "Item in category #{item.category.name} is too low. Add more." :
           "Item in category #{item.category.name} is low."

    User.where(admin: true).uniq.each do |user|
      @new_notify = {:notification => Notification.create(
        receiver: user,
        sender: User.current,
        message: msg,
        notifiable: item,
        priority: type
      )}
    end

    @new_notify[:sender] = User.current.name
    NotificationBroadcastJob.perform_later(@new_notify)
  end

  # def self.issue_new(issue)
  #   User.where(admin: true).uniq.each do |user|
  #    @new_notify = {:notification => Notification.create(
  #       receiver: user,
  #       sender: User.current,
  #       message: "Issue with item #{issue.item.name}",
  #       notifiable: issue.item,
  #       priority: "info"
  #     )}
  #   end

  #   @new_notify[:sender] = User.current.name
  #   ActionCable.server.broadcast "notifications_channel_admin", content: @new_notify
  # end

  # def self.issue_resolved(issue)
  #   @new_notify= {:notification =>  Notification.create(
  #     receiver: issue.user,
  #     sender: User.current,
  #     message: "Your Issue on item #{issue.item.name} has been resolved",
  #     notifiable: issue.item,
  #     priority: "success"
  #   )}

  #   @new_notify[:sender] = User.current.name
  #   ActionCable.server.broadcast "notifications_channel_#{issue.user.id}", content: @new_notify
  # end
end

class Notification < ApplicationRecord
  belongs_to :receiver, class_name: "User"
  belongs_to :sender, class_name: "User"
  belongs_to :notifiable, polymorphic: true

  scope :unread, -> { where(read_at: nil) }

  def self.low_buffer(storage, item)
    type = storage.qty < storage.min_buffer ? "danger" : "warning"
    User.where(admin: true).uniq.each do |user|
      Notification.create(
        receiver: user,
        sender: User.current,
        message: "Item #{item.name} is low. Only #{storage.qty} left",
        notifiable: storage,
        priority: type
      )
    end
  end

  def self.issue_new(issue)
    User.where(admin: true).uniq.each do |user|
      Notification.create(
        receiver: user,
        sender: User.current,
        message: "Issue with item #{issue.item.name}",
        notifiable: issue.item,
        priority: "info"
      )
    end
  end

  def self.issue_resolved(issue)
    Notification.create(
      receiver: issue.user,
      sender: User.current,
      message: "Your Issue on item #{issue.item.name} has been resolved",
      notifiable: issue.item,
      priority: "success"
    )
  end
end

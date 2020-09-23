class Issue < ApplicationRecord
  belongs_to :user
  belongs_to :item

  scope :issue_exist, ->(issue) { where(user: issue.user, item: issue.item, resolved: false).count }
end

class Item < ApplicationRecord
  mount_uploader :doc, DocumentUploader

  belongs_to :brand
  belongs_to :category
  belongs_to :user, optional: true

  has_one :issues

  validates_uniqueness_of :name, case_sensitive: false
  validates :name, presence: true, allow_blank: false

  def self.check_qty(item)
    category = item.category
    item_count = category.items.count
    if item_count <= category.buffer
      if item_count <= category.min_qty
        Notification.low_items(item, "high")
      else
        Notification.low_items(item, "low")
      end
    end
  end
end

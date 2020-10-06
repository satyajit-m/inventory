class Category < ApplicationRecord
  has_many :items, dependent: :destroy

  validates_uniqueness_of :name, case_sensitive: false
  validates :name, presence: true
  validates :min_qty, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :buffer, presence: true, numericality: { only_integer: true, greater_than: 0 }

  validate :min_qty_less_than_buffer

  def min_qty_less_than_buffer
    errors.add(:min_qty, "cant be greater than Buffer") if min_qty > buffer
  end
end

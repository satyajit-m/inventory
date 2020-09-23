class Storage < ApplicationRecord
  belongs_to :item

  validates_uniqueness_of :item_id, message: "Already Present"
  validates :qty, numericality: { only_integer: true, greater_than: 0 }
  validate :max_buffer_less_than_qty
  validate :min_buffer_less_thn_max_buffer

  def max_buffer_less_than_qty
    if max_buffer > qty
      errors.add(:max_buffer, "cant be greater than qty")
    elsif min_buffer <= 0
      errors.add(:max_buffer, "cant be less than or 0")
    end
  end

  def min_buffer_less_thn_max_buffer
    if min_buffer > max_buffer
      errors.add(:min_buffer, "cant be greater than max buffer")
    elsif min_buffer <= 0
      errors.add(:min_buffer, "cant be less than or 0")
    end
  end
end

class Item < ApplicationRecord
  validates_uniqueness_of :name, case_sensitive: false
  validates :name, presence: true, allow_blank: false
  belongs_to :brand
  belongs_to :category
  belongs_to :user
end

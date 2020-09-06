class Brand < ApplicationRecord
  validates_uniqueness_of :name, case_sensitive: false
  validates :name, presence: true

  has_many :items
end

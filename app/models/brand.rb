class Brand < ApplicationRecord
  has_many :items, dependent: :destroy

  validates_uniqueness_of :name, case_sensitive: false
  validates :name, presence: true
end

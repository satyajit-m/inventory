class Item < ApplicationRecord
  mount_uploader :doc, DocumentUploader

  belongs_to :brand
  belongs_to :category

  has_and_belongs_to_many :users, -> { distinct }

  has_one :storage
  has_many :issues

  validates_uniqueness_of :name, case_sensitive: false
  validates :name, presence: true, allow_blank: false
end

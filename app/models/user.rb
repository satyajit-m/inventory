class User < ApplicationRecord
  has_and_belongs_to_many :items

  has_many :notifications, foreign_key: :receiver_id
  has_many :issues

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_NAME_REGEX = /\A[^0-9`!@#\$%\^&*+_=]+\z/.freeze

  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates_format_of :name, { with: VALID_NAME_REGEX }

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

  def self.from_omniauth(auth)
    data = auth.info
    user = User.where(email: data["email"]).first
    user
  end

  def self.generate_auth_token(column, user)
    user[column] = SecureRandom.urlsafe_base64
    user.save!
  end
end

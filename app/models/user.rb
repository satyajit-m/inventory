class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :email, format: { with: VALID_EMAIL_REGEX }

  def self.from_omniauth(auth)
    data = auth.info
    user = User.where(email: data['email']).first
    user
  end

  def self.generate_auth_token(column, user)
    user[column] = SecureRandom.urlsafe_base64
    user.save!
  end
end

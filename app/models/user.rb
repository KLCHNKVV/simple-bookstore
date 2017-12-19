class User < ApplicationRecord
  has_many :orders
  validates :name, presence: true, uniqueness: true
  has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  private
  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end

end


class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def set_confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

  def validate_email
    self.email_confirmed = true
    self.confirm_token = nil
  end

  private
  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end
end


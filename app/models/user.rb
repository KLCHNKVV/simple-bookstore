class User < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }

  before_save {self.email = email.downcase}
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

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
    save!(:validate => false)
  end

  private
  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end
end


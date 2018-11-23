class User < ApplicationRecord
  has_secure_password

  EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  # `length` limitation is for view styling
  validates :username, presence: true, uniqueness: true, length: { maximum: 16 }
  validates :email,    presence: true, uniqueness: true, format: { with: EMAIL_REGEXP }
  validates :confirmation_token, presence: true

  def assign_confirmation_token
    self.confirmation_token = SecureRandom.urlsafe_base64
  end

  def confirmed?
    confirmed_at?
  end

  def confirm!
    update!(confirmed_at: Time.current)
  end

  def update_confirmation_token!
    assign_confirmation_token
    self.confirmed_at = nil
    save!
    ::UserMailer.with(user: self).confirm.deliver_later
  end
end

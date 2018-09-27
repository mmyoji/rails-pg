class User < ApplicationRecord
  has_secure_password

  EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  # `length` limitation is for view styling
  validates :username, presence: true, uniqueness: true, length: { maximum: 16 }
  validates :email,    presence: true, uniqueness: true, format: { with: EMAIL_REGEXP }
end

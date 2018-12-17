class User < ApplicationRecord
  has_secure_password
  validates :email, format: URI::MailTo::EMAIL_REGEXP, uniqueness: true

  has_many :tasks, dependent: :destroy
end

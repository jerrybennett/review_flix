class User < ApplicationRecord
  has_many :movies
  has_many :reviews
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
    format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" },
    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end

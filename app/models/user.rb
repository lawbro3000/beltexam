class User < ApplicationRecord
  has_secure_password
  has_many :friendships
  has_many :invites, through: :users
  LETTERS_ONLY_REGEX = /\A^[A-Za-z]+$\z/
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :email, :password, presence: true
  validates :name,  uniqueness: { case_sensitive: false }, format: { with: LETTERS_ONLY_REGEX }, length: { in: 2..50 }
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }, length: { in: 8..40 }
  validates :password, length: { in: 8..20 }
  validates_confirmation_of :password

  before_save do
    self.name.capitalize!
    self.email.downcase!
  end
end


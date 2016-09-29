class User < ApplicationRecord
  has_secure_password
  validates :fname, presence: true
  validates :lname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  has_many :memberships
end

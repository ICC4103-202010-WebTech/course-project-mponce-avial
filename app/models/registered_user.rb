class RegisteredUser < ApplicationRecord
  validates :email_address, format: {with: /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i}, uniqueness: true
  validates :username, uniqueness: true
  has_many :events
  has_one :user_profile
  has_one :blacklist
  has_many :organizations
  has_many :comments
  has_many :replies
end

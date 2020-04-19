class RegisteredUser < ApplicationRecord
  validates :email_address, format: {with: /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i}, uniqueness: true
  validates :username, uniqueness: true
  has_many :events
  has_one :user_profile
  has_one :blacklist
  has_many :organization_admins
  has_many :comments
  has_many :replies
  has_many :event_guests
  has_many :messages
  has_many :organization_members
  has_many :system_administrators
end

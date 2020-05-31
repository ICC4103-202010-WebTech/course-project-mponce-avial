class RegisteredUser < ApplicationRecord
  validates :email_address, format: {with: /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i}, uniqueness: true
  validates :username, uniqueness: true
  has_many :events, dependent: :destroy
  has_one :user_profile, dependent: :destroy
  has_one :blacklist, dependent: :destroy
  has_many :organization_admins, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :event_guests, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :organization_members, dependent: :destroy
  has_many :system_administrators, dependent: :destroy
end

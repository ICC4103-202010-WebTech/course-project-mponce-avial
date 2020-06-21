class RegisteredUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable
  validates :email, format: {with: /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i}, uniqueness: true
  validates :username, uniqueness: true
  has_many :events, dependent: :destroy, foreign_key: "event_creator_id"
  has_one :user_profile, dependent: :destroy
  has_one :blacklist, dependent: :destroy, foreign_key: "blacklist_owner_id"
  has_many :organization_admins, dependent: :destroy, foreign_key: "admin_id"
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :event_guests, dependent: :destroy
  has_many :messages, dependent: :destroy, foreign_key: "sender_user_id"
  has_many :organization_members, dependent: :destroy
end

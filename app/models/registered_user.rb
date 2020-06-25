class RegisteredUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :omniauthable, omniauth_providers: [:google_oauth2]
  validates :email, format: {with: /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i}, uniqueness: true
  validates :username, uniqueness: true
  before_create :build_user_profile
  has_many :events, dependent: :destroy, foreign_key: "event_creator_id"
  has_one :user_profile, dependent: :destroy
  has_many :organization_admins, dependent: :destroy, foreign_key: "admin_id"
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :event_guests, dependent: :destroy
  has_many :messages, dependent: :destroy, foreign_key: "sender_user_id"
  has_many :organization_members, dependent: :destroy

  require 'securerandom'
  def self.from_google(email:, first_name:, last_name:)
    create_with(name: first_name, last_name: last_name, password: SecureRandom.urlsafe_base64, username: email).find_or_create_by!(email: email)
  end
end

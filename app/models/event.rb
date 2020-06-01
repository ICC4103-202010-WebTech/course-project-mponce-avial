class Event < ApplicationRecord
  belongs_to :event_creator, :class_name => 'RegisteredUser', :foreign_key => 'event_creator_id'
  belongs_to :organization,optional: true
  has_many :comments, dependent: :destroy
  has_many :event_guests, dependent: :destroy
  has_many :event_images, dependent: :destroy
  has_many :event_pdfs, dependent: :destroy
  has_many :event_videos, dependent: :destroy
  has_one_attached :bannerEvent
end

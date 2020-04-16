class Event < ApplicationRecord
  belongs_to :registered_user
  has_many :comments
  has_many :event_guests
  has_many :event_images
  has_many :event_pdfs
  has_many :event_videos
end

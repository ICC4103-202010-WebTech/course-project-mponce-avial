class Event < ApplicationRecord
  belongs_to :event_creator, :class_name => 'RegisteredUser', :foreign_key => 'event_creator_id'
  has_many :comments
  has_many :event_guests
  has_many :event_images
  has_many :event_pdfs
  has_many :event_videos
end

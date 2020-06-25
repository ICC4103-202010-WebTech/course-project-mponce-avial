class Event < ApplicationRecord
  validates :title, :description,:number_of_voters, :presence => true
  belongs_to :event_creator, :class_name => 'RegisteredUser', :foreign_key => 'event_creator_id'
  belongs_to :organization,optional: true
  has_many :comments, dependent: :destroy
  has_many :event_guests, dependent: :destroy
  has_many :event_images, dependent: :destroy
  has_many :event_pdfs, dependent: :destroy
  has_many :event_videos, dependent: :destroy
  has_one_attached :bannerEvent
  has_many_attached :imgEvent
  has_many_attached :videosEvent
  has_many_attached :pdfEvent

  before_destroy :delete_blacklists

  private
  def delete_blacklists
    Blacklist.where(:reported_type => "event", :reported_id => self.id).each { |b|
      b.destroy
    }
  end
end

class UserProfile < ApplicationRecord
  belongs_to :registered_user
  has_one_attached :bannerProfile
  has_one_attached :imageProfile

  before_destroy :delete_blacklists

  private
  def delete_blacklists
    Blacklist.where(:reported_type => "user", :reported_id => self.id).each { |b|
      b.destroy
    }
  end
end

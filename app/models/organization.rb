class Organization < ApplicationRecord
  has_many :organization_members, dependent: :destroy
  has_many :organization_admins, dependent: :destroy
  has_many :events, dependent: :destroy
  has_one_attached :bannerOrg

  before_destroy :delete_blacklists

  private
  def delete_blacklists
    Blacklist.where(:reported_type => "organization", :reported_id => self.id).each { |b|
      b.destroy
    }
  end
end

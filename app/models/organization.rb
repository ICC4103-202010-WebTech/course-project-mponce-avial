class Organization < ApplicationRecord
  has_many :organization_members, dependent: :destroy
  has_many :organization_admins, dependent: :destroy
  has_many :events, dependent: :destroy
  has_one_attached :bannerOrg
end

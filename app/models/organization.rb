class Organization < ApplicationRecord
  has_many :organization_members
  has_many :organization_admins
  has_many :events
end

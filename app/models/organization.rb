class Organization < ApplicationRecord
  belongs_to :registered_user
  has_many :organization_members
end

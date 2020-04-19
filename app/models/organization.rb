class Organization < ApplicationRecord
  belongs_to :organization_admin, :class_name => 'RegisteredUser', :foreign_key => 'organization_admin_id'
  has_many :organization_members
end

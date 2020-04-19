class OrganizationAdmin < ApplicationRecord
  belongs_to :admin, :class_name => 'RegisteredUser', :foreign_key => 'admin_id'
  belongs_to :organization
end

class OrganizationMember < ApplicationRecord
  belongs_to :organization
  belongs_to :registered_user
end

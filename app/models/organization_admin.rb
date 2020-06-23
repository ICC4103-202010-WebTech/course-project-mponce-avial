class OrganizationAdmin < ApplicationRecord
  belongs_to :admin, :class_name => 'RegisteredUser', :foreign_key => 'admin_id'
  belongs_to :organization

  after_destroy :check_for_org_destruction

  private
    def check_for_org_destruction
      if self.organization.organization_admins.count == 0
        self.organization.destroy
      end
    end
end

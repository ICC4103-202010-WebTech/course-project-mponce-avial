class AddUserIdToOrganizationMember < ActiveRecord::Migration[6.0]
  def change
    add_reference :organization_members, :registered_users, null: true, foreign_key: true
  end
end

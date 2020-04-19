class AddOrganizationIdToOrganizationMember < ActiveRecord::Migration[6.0]
  def change
    add_reference :organization_members, :organization_members, null: true, foreign_key: true
  end
end

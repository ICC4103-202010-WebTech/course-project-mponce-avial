class CreateOrganizationMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_members do |t|
      t.references :registered_user
      t.references :organization
      t.timestamps
    end
  end
end

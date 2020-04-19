class CreateOrganizationAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_admins do |t|
      t.references :organization
      t.references :admin
      t.timestamps
    end
  end
end

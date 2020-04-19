class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :organization_banner
      t.references :organization_admin
      t.timestamps
    end
  end
end

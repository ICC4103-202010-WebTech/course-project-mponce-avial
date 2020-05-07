class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :organization_banner
      t.string :description
      t.timestamps
    end
  end
end

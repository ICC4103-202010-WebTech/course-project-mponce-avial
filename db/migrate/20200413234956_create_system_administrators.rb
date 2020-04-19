class CreateSystemAdministrators < ActiveRecord::Migration[6.0]
  def change
    create_table :system_administrators do |t|
      t.references :registered_user
      t.timestamps
    end
  end
end

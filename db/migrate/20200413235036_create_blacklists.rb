class CreateBlacklists < ActiveRecord::Migration[6.0]
  def change
    create_table :blacklists do |t|
      t.string :reported_type
      t.integer :reported_id
      t.references :user_report
      t.string :message
      t.timestamps
    end
  end
end

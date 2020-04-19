class CreateBlacklists < ActiveRecord::Migration[6.0]
  def change
    create_table :blacklists do |t|
      t.references :blacklist_owner
      t.references :banned_user
      t.timestamps
    end
  end
end

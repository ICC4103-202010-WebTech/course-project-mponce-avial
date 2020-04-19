class CreateEventGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :event_guests do |t|
      t.integer :date_vote
      t.references :event
      t.references :registered_user
      t.timestamps
    end
  end
end

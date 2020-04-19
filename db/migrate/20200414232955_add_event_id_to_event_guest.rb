class AddEventIdToEventGuest < ActiveRecord::Migration[6.0]
  def change
    add_reference :event_guests, :events, null: true, foreign_key: true
  end
end

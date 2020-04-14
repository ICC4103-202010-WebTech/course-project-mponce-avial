class AddUserIdToEventGuest < ActiveRecord::Migration[6.0]
  def change
    add_reference :event_guests, :registered_users, null: false, foreign_key: true
  end
end

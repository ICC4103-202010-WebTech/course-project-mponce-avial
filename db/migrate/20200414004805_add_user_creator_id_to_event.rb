class AddUserCreatorIdToEvent < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :registered_users, null: true, foreign_key: true
  end
end
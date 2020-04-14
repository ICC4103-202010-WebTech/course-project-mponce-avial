class AddUserIdToSystemAdministrator < ActiveRecord::Migration[6.0]
  def change
    add_reference :system_administrators, :registered_users, null: false, foreign_key: true
  end
end

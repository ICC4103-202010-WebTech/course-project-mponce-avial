class AddUserIdToUserProfile < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_profiles, :registered_users, null: false, foreign_key: true
  end
end

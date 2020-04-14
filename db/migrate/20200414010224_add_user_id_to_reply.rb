class AddUserIdToReply < ActiveRecord::Migration[6.0]
  def change
    add_reference :replies, :registered_users, null: false, foreign_key: true
  end
end

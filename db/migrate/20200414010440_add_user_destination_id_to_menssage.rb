class AddUserDestinationIdToMenssage < ActiveRecord::Migration[6.0]
  def change
    add_reference :menssages, :registered_users, null: false, foreign_key: true
  end
end

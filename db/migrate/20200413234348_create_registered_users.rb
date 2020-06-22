class CreateRegisteredUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :registered_users do |t|
      t.string :name
      t.string :last_name
      t.integer :age
      t.string :username
      t.string :password
      t.string :location

      t.timestamps
    end
  end
end

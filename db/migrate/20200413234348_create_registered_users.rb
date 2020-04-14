class CreateRegisteredUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :registered_users do |t|
      t.string :name
      t.string :last_name
      t.integer :age
      t.string :username
      t.string :email_address
      t.string :google_account
      t.string :password

      t.timestamps
    end
  end
end

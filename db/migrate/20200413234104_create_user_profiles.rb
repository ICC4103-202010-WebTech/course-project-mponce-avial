class CreateUserProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_profiles do |t|
      t.string :name
      t.string :last_name
      t.string :username
      t.integer :age
      t.string :location
      t.string :profile_picture

      t.timestamps
    end
  end
end

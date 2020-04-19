class CreateUserProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_profiles do |t|
      t.string :profile_picture
      t.string :banner_picture
      t.references :registered_user
      t.timestamps
    end
  end
end

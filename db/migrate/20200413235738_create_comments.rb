class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :profile_picture
      t.string :text
      t.string :image
      t.references :registered_user
      t.references :event
      t.timestamps
    end
  end
end

class CreateMenssages < ActiveRecord::Migration[6.0]
  def change
    create_table :menssages do |t|
      t.string :text
      t.references :sender_user
      t.references :destination_user
      t.timestamps
    end
  end
end

class CreateMenssages < ActiveRecord::Migration[6.0]
  def change
    create_table :menssages do |t|
      t.string :text

      t.timestamps
    end
  end
end

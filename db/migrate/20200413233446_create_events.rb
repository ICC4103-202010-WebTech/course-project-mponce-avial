class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :banner
      t.string :location
      t.datetime :final_date
      t.string :date_rule

      t.timestamps
    end
  end
end

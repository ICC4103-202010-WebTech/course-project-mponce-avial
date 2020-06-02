class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :banner
      t.string :location
      t.datetime :final_date
      t.datetime :date1
      t.datetime :date2
      t.datetime :date3
      t.string :date_rule
      t.string :visibility
      t.references :organization
      t.references :event_creator

      t.timestamps
    end
  end
end

class CreateEventPdfs < ActiveRecord::Migration[6.0]
  def change
    create_table :event_pdfs do |t|
      t.string :pdf
      t.references :event
      t.timestamps
    end
  end
end

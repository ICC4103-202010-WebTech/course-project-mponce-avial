class AddEventIdToEventPdf < ActiveRecord::Migration[6.0]
  def change
    add_reference :event_pdfs, :events, null: false, foreign_key: true
  end
end

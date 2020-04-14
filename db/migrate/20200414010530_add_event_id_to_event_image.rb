class AddEventIdToEventImage < ActiveRecord::Migration[6.0]
  def change
    add_reference :event_images, :events, null: false, foreign_key: true
  end
end

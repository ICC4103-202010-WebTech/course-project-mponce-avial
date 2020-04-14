class AddEventIdToEventVideo < ActiveRecord::Migration[6.0]
  def change
    add_reference :event_videos, :events, null: false, foreign_key: true
  end
end

class CreateEventVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :event_videos do |t|
      t.string :video
      t.references :event
      t.timestamps
    end
  end
end

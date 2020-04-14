class CreateEventVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :event_votes do |t|
      t.datetime :date_vote

      t.timestamps
    end
  end
end

class AddCommentIdToReply < ActiveRecord::Migration[6.0]
  def change
    add_reference :replies, :comments, null: true, foreign_key: true
  end
end

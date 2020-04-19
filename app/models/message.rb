class Message < ApplicationRecord
  #belongs_to :registered_user
  belongs_to :sender_user, :class_name => 'RegisteredUser', :foreign_key => 'sender_user_id'
  belongs_to :destination_user, :class_name => 'RegisteredUser', :foreign_key => 'destination_user_id'
end

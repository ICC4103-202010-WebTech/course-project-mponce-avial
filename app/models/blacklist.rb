class Blacklist < ApplicationRecord
  #belongs_to :registered_user
  belongs_to :registered_user, :class_name => 'RegisteredUser', :foreign_key => 'registered_user_id'
  belongs_to :banned_user, :class_name => 'RegisteredUser', :foreign_key => 'banned_user_id'
end

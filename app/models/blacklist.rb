class Blacklist < ApplicationRecord
  belongs_to :blacklist_owner, :class_name => 'RegisteredUser', :foreign_key => 'blacklist_owner_id'
  belongs_to :banned_user, :class_name => 'RegisteredUser', :foreign_key => 'banned_user_id'
end

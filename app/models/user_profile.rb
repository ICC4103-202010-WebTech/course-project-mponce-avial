class UserProfile < ApplicationRecord
  belongs_to :registered_user
  accepts_nested_attributes_for :registered_user
end

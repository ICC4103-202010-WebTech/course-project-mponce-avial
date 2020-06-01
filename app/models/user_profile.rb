class UserProfile < ApplicationRecord
  belongs_to :registered_user
  has_one_attached :bannerProfile
end

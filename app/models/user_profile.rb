class UserProfile < ApplicationRecord
  belongs_to :registered_user
  has_one_attached :bannerProfile
  has_one_attached :imageProfile
end

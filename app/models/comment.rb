class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :registered_user
  has_many :replies, dependent: :destroy
end

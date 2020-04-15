class Event < ApplicationRecord
  belongs_to :registered_user
  has_many :comments
end

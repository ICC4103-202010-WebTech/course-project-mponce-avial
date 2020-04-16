class EventGuest < ApplicationRecord
  belongs_to :event
  belongs_to :registered_user
end

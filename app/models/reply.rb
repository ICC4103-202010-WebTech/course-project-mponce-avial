class Reply < ApplicationRecord
  belongs_to :comment
  belongs_to :registered_user
end

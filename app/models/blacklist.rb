class Blacklist < ApplicationRecord
  belongs_to :user_report, :class_name => 'RegisteredUser', :foreign_key => 'user_report_id'
end

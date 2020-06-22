class AdminController < ActionController::Base
  before_action :authenticate_system_administrator!
  layout "admin"
end


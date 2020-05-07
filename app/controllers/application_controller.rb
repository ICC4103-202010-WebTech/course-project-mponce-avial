class ApplicationController < ActionController::Base
  before_action :set_registereduser

  private

  def set_registereduser
    @@registered_user = RegisteredUser.first
  end
end

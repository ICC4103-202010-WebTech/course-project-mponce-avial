class ApplicationController < ActionController::Base
  before_action :set_registereduser
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def set_registereduser
    @@registered_user = RegisteredUser.first
  end

  protected

  def current_user
    if current_registered_user
      current_registered_user
    elsif current_system_administrator
      current_system_administrator
    else
      RegisteredUser.new
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :lastname ])
  end
end

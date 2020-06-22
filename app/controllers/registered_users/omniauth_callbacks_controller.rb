# frozen_string_literal: true

class RegisteredUsers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    registered_user = RegisteredUser.from_google(from_google_params)

    if registered_user.present?
      sign_out_all_scopes
      flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect registered_user, event: :authentication
    else
      flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
      redirect_to new_registered_user_session_path
    end
  end

  protected

  def after_omniauth_failure_path_for(_scope)
    new_registered_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end

  private

  def from_google_params
    @from_google_params ||= {
        email: auth.info.email,
        first_name: auth.info.first_name,
        last_name: auth.info.last_name
    }
  end

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end

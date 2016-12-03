class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def ensure_signup_complete
    return if action_name == 'finish_signup'
    if current_user && !current_user.account_number == nil
      redirect_to finish_signup_path(current_user)
    end
  end

  # private
  # def require_login
  #   sign_in_url = new_user_session_url
  #   if request.referer == sign_in_url
  #     redirect_to sign_in_url
  #   else
  #   request.referer || root_path
  #   end
  # end

  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end

end

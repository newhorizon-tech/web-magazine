class ApplicationController < ActionController::Base
  def logged_in?
    !session[:user_id].nil?
  end
  helper_method :logged_in?

  def current_user
    User.find(session[:user_id])
  end
  helper_method :current_user

  def redirect_if_not_logged_in
    return if logged_in?

    flash.alert = 'Please log in'
    render new_user_path
  end
  helper_method :redirect_if_not_logged_in
end

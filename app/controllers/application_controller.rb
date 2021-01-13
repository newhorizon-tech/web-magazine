class ApplicationController < ActionController::Base

  def logged_in?
    !(session[:user_id].nil?)
  end
  helper_method :logged_in?

  def current_user
    User.find(session[:user_id])
  end
  helper_method :current_user
end

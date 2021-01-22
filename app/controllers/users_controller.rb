class UsersController < ApplicationController
  # Hybrid controller that handles temporary user sessions
  def new
    @user = User.new
  end

  # Check if a user exists
  # If user exists, log in; if user does not exist, create a new user
  def create
    @user = User.new(user_params)
    @user.name = @user.name.strip
    if @user.valid?
      @user.save
      flash.alert = "Your account has been created, #{@user.name}"
    else
      @user = User.find_by(name: @user.name)
      flash.alert = "Welcome back, #{@user.name}!"
    end
    session[:user_id] = @user.id
    session[:name] = @user.name
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash.alert = 'Logged out!'
    redirect_to root_path
  end

  private

  def user_params
    params.permit(:name)
  end
end

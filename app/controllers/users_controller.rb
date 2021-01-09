class UsersController < ApplicationController
    def new
     @user = User.new
    end
    def create
      @user = User.new(user_params)
      if @user.valid?
        @user.save
        flash.alert = "Your account has been created, #{@user.username}"
      else
        @user = User.find_by(username: @user.name)
        flash.alert = "Welcome Back, #{@user.name}!"
      end
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect_to root_path
    end

    private
    def user_params
      params.require(:user).permit(:name)
    end
end

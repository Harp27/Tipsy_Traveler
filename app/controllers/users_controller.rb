
class UsersController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        # Handle successful registration (e.g., redirect to login page)
      else
        # Handle registration errors (e.g., display error messages)
        render 'new'
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
  end
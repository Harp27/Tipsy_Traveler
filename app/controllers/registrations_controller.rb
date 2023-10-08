
class RegistrationController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        # Handle successful registration (e.g., redirect to a welcome page)
      else
        render :new
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
  end
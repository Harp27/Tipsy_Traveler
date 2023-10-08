class LoginPageController < ApplicationController
  def login
    if request.post?
      # Handle the login form submission here
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        # Authentication successful, redirect to the user's dashboard or another page
        redirect_to user_dashboard_path(@user)
      else
        # Authentication failed, display an error message
        flash[:alert] = 'Invalid username or password'
        render :login  # Render the login page with the error message
      end
    end
  end
end
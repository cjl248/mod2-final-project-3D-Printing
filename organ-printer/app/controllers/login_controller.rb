class LoginController < ApplicationController

  def new
    render 'new'
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      sessions["user_id"] = @user.id
      flash[:messages] = "Logging in #{@user.username}"
      redirect_to @user
    else
      flash[:messages] = "Incorrect username or password"
      redirect_to '/welcome'
    end
  end

end

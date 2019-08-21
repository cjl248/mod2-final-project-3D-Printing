class LoginController < ApplicationController

  def new
    if @logged_in
      redirect_to @current_user
    else
      render 'new'
    end
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session["user_id"] = @user.id
      flash[:messages] = "Logging in #{@user.username}"
      redirect_to @user
    else
      flash[:messages] = "Incorrect username or password"
      #byebug
      redirect_to '/login'
    end
  end

  def destroy
    logout
    redirect_to '/login'
  end

end

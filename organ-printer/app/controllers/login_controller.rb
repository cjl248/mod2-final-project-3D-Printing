class LoginController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

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
      redirect_to @user
    else
      flash[:message] = "Incorrect username or password"
      #byebug
      redirect_to '/login'
    end
  end

  def destroy
    logout
    redirect_to '/login'
  end

end

class UsersController < ApplicationController

  def show
    if @logged_in
      find_user()
    else
      redirect_to '/login'
    end
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @user.update(balance: 500.00)
      session["user_id"] = @user.id
      flash[:messages] = "Registered #{@user.username}"
      redirect_to @user
    else
      flash[:messages] = "Inapropriate Registration Info"
      redirect_to new_user_path
    end
  end

  def organs
    find_user
    @organs = @user.organs
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end

class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def show
    if @logged_in
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
      flash[:message] = "Registered #{@user.username}"
      redirect_to @user
    else
      flash[:message] = "Inapropriate Registration Info"
      redirect_to new_user_path
    end
  end

  def edit
    render 'edit'
  end

  def update
    @current_user.update(user_params)
    redirect_to @current_user
  end

  def store
    @balance = @current_user.balance - 100.0
    @current_user.update(balance: @balance)
    redirect_to user_user_organs_path(@current_user)
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end

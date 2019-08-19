class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def organs
    find_user
    @organs = @user.organs
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

end

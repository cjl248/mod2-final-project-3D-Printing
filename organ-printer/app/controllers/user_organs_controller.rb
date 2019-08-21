class UserOrgansController < ApplicationController

  def index
    @user = User.find(params[:id])
    @organs = @user.organs
  end

  def new
    @user_organ = UserOrgan.new
    @organs = Organ.all
    @components = Component.all
  end

  def create
    @user_organ = UserOrgan.new(params.require(:user_organ).permit(:organ_id))
    @user_organ.user_id = 1
    selected_components = params[:user_organ][:component_ids]
    @user_organ.compare_ids(selected_components)
    # flash[:errors] = @userOrgan.compare_ids(params[:])
  end

end

class UserOrgansController < ApplicationController

  def index
    @user = User.find(params[:id])
    @organs = @user.organs
  end

  def new
    @user_organ = UserOrgan.new(flash[:user_org_hash])
    @organs = Organ.all
    @components = Component.all
    @selected_components = flash[:array] || []
  end

  def create
    
    @user_organ = UserOrgan.new(params.require(:user_organ).permit(:organ_id))
    #need to stop hard coding this eventually
    @user_organ.user_id = 1
    @selected_components = params[:components]
    flash[:array] = @selected_components
    flash[:user_org_hash] = @user_organ.attributes
    
    if @user_organ.compare_ids(@selected_components) != nil
      flash[:error] = @user_organ.compare_ids(@selected_components)
    elsif @user_organ.check_minimum(@selected_components)
      flash[:error] = @user_organ.check_minimum(@selected_components)
    end

    if flash[:error]
      @organs = Organ.all
      @components = Component.all
      # consider render :new versus redirect_to new_user_organ_path
      #also need to figure out how to keep the same boxes ticked even after the error pops up
      # render :new
      redirect_to new_user_organ_path
    else
      @user_organ.save
      #should eventually redirect to organ show page, with the randomely generated price
      redirect_to @user_organ
    end
  end

  def show
    @user_organ = UserOrgan.find(params[:id])
  end

end

class UserOrgansController < ApplicationController

  def index
    @user_organs = @current_user.user_organs
  end

  def new
      @user_organ = UserOrgan.new(flash[:user_org_hash])
      @organs = Organ.all
      @components = Component.all
      @selected_components = flash[:array] || []
  end

  def create

    @user_organ = UserOrgan.new(params.require(:user_organ).permit(:organ_id))
    @user_organ.user_id = @user_id
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
      redirect_to new_user_user_organ_path
    else
      @user_organ.save
      @new_balance = @user_organ.user.balance - @selected_components.map{|t| Component.find(t).price}.sum
      @user_organ.user.update(balance: @new_balance)
      redirect_to @user_organ
    end
  end

  def show
    @user_organ = UserOrgan.find(params[:id])
    @price = @user_organ.organ.random_price.round(2)
  end

  def check
    @user_organ = UserOrgan.find(params[:id])
    @balance = @current_user.balance - 100.0
    @current_user.update(balance: @balance)
    redirect_to @user_organ
  end

  def destroy
    @price = params[:price].to_f
    @new_balance = @current_user.balance + @price
    @current_user.update(balance: @new_balance)
    @user_organ = UserOrgan.find(params[:id])
    @user_organ.destroy
    redirect_to @current_user
  end

end

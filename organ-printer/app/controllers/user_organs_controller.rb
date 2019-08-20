class UserOrgansController < ApplicationController

  def new
    byebug
    @user_organ = UserOrgan.new(user: params[:id])
    @organs = Organ.all
    @components = Component.all
  end

end

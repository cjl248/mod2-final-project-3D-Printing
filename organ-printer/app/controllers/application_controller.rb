class ApplicationController < ActionController::Base
  before_action :set_up_auth_variables
  before_action :authorized

  def set_up_auth_variables
    @user_id = session["user_id"]
    @logged_in = !!@user_id
    if @logged_in
      @current_user = User.find_by(id: @user_id)
      if !@current_user
        session.clear
      end
    end
  end

  def authorized
    #unless is like if !(condition)
    unless @logged_in
      flash[:message] = "Please login to view this page"
      return redirect_to login_path
    end

    if @current_user.balance < 0
      flash[:warning] = "The black-market mafia is hot on your trail ... get out of debt ASAP or risk being shot "
    end
  end

  def logout
    session["user_id"] = nil
  end

end

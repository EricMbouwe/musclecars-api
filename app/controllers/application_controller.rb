class ApplicationController < ActionController::API
  before_action :set_current_user
  before_action :require_login

  private

  def require_login
    # if !@current_user
    #   flash[:error] = "You must be logged in to access this section"
    #   redirect_to new_login_url # halts request cycle
    # end
  end

  def set_current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end
end

class ApplicationController < ActionController::API
  before_action :set_current_user
  before_action :require_login

  def require_login
    return if @current_user

    render json: {
      message: 'you do not belong there (Not a User)',
      status: 'AD'
    }
  end

  def set_current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end
end

class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[create logged_in]
  skip_before_action :set_current_user, only: [:create]

  def create
    user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

    if user
      session[:user_id] = user.id
      session[:expiry] = 300

      render json: {
        status: :created,
        logged_in: true,
        user: user
      }
    else
      render json: { status: 401 }
    end
  end

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: { logged_in: false }
    end
  end

  def logout
    session[:user_id] = nil
    render json: {
      logged_out: true,
      status: 200,
      message: 'session destroyed'
    }
  end
end

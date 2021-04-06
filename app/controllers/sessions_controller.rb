class SessionsController < ApplicationController
  def index
    render json: { session: session }
  end

  def create
    # ser = User.find_by(email: params["user"]["email"]).try(:authenticate, params["user"]["password"])
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
    reset_session
    render json: {
      logged_out: true,
      status: 200,
      message: 'session destroyed'
    }
  end
end

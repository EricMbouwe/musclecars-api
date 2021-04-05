class SessionsController < ApplicationController
  def index
    render json: { 
        session: session 
    }
  end

  def create
    #ser = User.find_by(email: params["user"]["email"]).try(:authenticate, params["user"]["password"])
    user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user,
        session: session,
      }
    else
      render json: { status: 401 }
    end
  end

  def destroy
    reset_session
    render json: { message: "session destroyed" }
  end
end

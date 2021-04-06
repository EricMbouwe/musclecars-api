class UsersController < ApplicationController
  def index
    users = User.all
    render json: { users: users }
  end

  def create
    #user = User.create!(user_params)
    user = User.create!(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

    if user.save
      session[:user_id] = user.id
      
      render json: {
        user: user,
        status: :created
      }
    else
      render json: { status: 500 }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

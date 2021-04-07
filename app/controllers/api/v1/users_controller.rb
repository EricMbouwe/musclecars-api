class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users
    # render json: { users: users }
    # render json: users, only: [:name, :email]
  end

  def create
    # user = User.create!(user_params)

    user = User.create!(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

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

  # GET /users/1
  def show
    user = User.find(params[:id])
    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
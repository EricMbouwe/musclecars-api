class UsersController < ApplicationController
  def index
    users = User.all
    render json: { users: users }
  end

  def create
    user = User.create(user_params)

    if user.save
      session[:user_id] = user.id
      render json: { user: user }
    else
      render json: { status: 401 }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end

class Admin::UsersController < Admin::BaseController
  def index
    users = User.all
    render json: users
    # render json: { users: users }
    # render json: users, only: [:name, :email]
  end

  def create
    # user = User.create!(user_params)
    user = User.create(
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

  def show
    user = User.find(params[:id])
    render json: user
  end
  
  def update
    user = User.find(params[:id])

    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

class Api::V1::UsersController < ApplicationController
  # skip_before_action :require_login, only: [:create]
  skip_before_action :set_current_user, only: [:create]

  def create
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
end

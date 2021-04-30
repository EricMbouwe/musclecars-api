class Api::V1::CarsController < ApplicationController
  before_action :set_car, only: [:show]
  skip_before_action :require_login, only: [:index]

  def index
    @cars = Car.all

    render json: @cars
  end

  def show
    render json: @car
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:name, :price, :description)
  end
end

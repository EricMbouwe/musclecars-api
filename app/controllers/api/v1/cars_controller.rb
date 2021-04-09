class Api::V1::CarsController < ApplicationController
  before_action :set_car, only: %i[show]
  skip_before_action :require_login, only: [:index]

  # GET /cars
  def index
    @cars = Car.all

    render json: @cars
    # render json: @cars.include(:appointments)
  end

  # GET /cars/1
  def show
    render json: @car
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.require(:car).permit(:name, :price, :description)
  end
end

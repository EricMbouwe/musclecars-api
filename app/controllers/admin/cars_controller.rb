class Admin::CarsController < Admin::BaseController
  before_action :set_car, only: %i[show update destroy]

  def index
    @cars = Car.all

    render json: @cars
  end

  def show
    render json: @car
  end

  def create
    @car = Car.create!(car_params)

    if @car.save
      render json: @car
    else
      render json: @car.errors
    end
  end

  def update
    if @car.update(car_params)
      render json: @car
    else
      render json: @car.errors
    end
  end

  def destroy
    @car.destroy
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:name, :price, :description)
  end
end

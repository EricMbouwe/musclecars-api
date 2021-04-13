class Admin::PicturesController < Admin::BaseController
  before_action :set_picture, only: %i[show update destroy]
  before_action :find_car

  def index
    @pictures = @car.pictures

    render json: @pictures
  end

  def show
    render json: @picture
  end

  def create
    @picture = @car.pictures.build(picture_params)

    if @picture.save
      render json: @picture
    else
      render json: @picture.errors
    end
  end

  def update
    if @picture.update(picture_params)
      render json: @picture
    else
      render json: @picture.errors
    end
  end

  def destroy
    @picture.destroy
  end

  private

  def find_car
    @car = Car.find(params[:car_id])
  end

  def set_picture
    @picture = @car.pictures.find(params[:id])
  end

  def picture_params
    params.fetch(:picture, {}).permit(:url)
  end
end

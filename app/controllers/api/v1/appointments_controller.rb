class Api::V1::AppointmentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_user
  before_action :set_appointment, only: %i[show update destroy]

  def index
    @appointments = @user.appointments

    render json: @appointments
  end

  def create
    @appointment = @user.appointments.build(appointment_params)

    if @appointment.save
      render json: @appointment
    else
      render json: @appointment.errors
    end
  end

  def destroy
    @appointment.destroy
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def set_appointment
    @appointment = @user.appointments.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :city, :car_id)
  end
end

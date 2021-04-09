class Api::V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show update destroy]
  before_action :find_user

  def index
    @appointments = @user.appointments

    render json: @appointments
  end

  def show
    render json: @appointment
  end

  def create
    @appointment = @user.appointments.build(appointment_params)

    if @appointment.save
      render json: @appointment, status: :created, location: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @appointment.update(appointment_params)
      render json: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
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
    params.require(:appointment).permit(:appointment_date, :city)
  end
end

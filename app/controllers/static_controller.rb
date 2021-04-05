class StaticController < ApplicationController
  def home
    render json: { message: 'It is working from Home' }
  end
end

class StaticController < ApplicationController
  skip_before_action :require_login

  def home
    render json: { message: 'It is working from Home' }
  end
end

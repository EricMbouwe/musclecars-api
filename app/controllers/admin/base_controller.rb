class Admin::BaseController < ApplicationController
  before_action :ensure_admin_user

  def ensure_admin_user
    unless @current_user and is_admin?
      render json: {
        message: 'you do not belong there (Not an Admin)',
        status: 'AD'
      }
    end
  end

  private

  def is_admin?
    @current_user.role === 'admin'
  end
end

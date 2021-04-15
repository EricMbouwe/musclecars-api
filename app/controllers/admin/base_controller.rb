class Admin::BaseController < ApplicationController
  before_action :ensure_admin_user

  def ensure_admin_user
    if @current_user and admin?

    else
      render json: {
        message: 'you do not belong there (Not an Admin)',
        status: 'AD'
      }
    end
  end

  private

  def admin?
    @current_user.role == 'admin'
  end
end

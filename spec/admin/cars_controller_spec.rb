require 'rails_helper'

RSpec.describe Admin::CarsController, type: :controller do
  describe 'GET #index' do
    context 'if the current user can access cars in the database as an admin' do
      it 'allow our admin user to view cars' do
        user = FactoryBot.build(:user, role: 'admin')
        @request.session[:user_id] = user.id

        get :index

        assert_response :success
      end

      it 'does not allow our regular user to view cars' do
        user = FactoryBot.build(:user, role: 'user')
        @request.session[:user_id] = user.id

        get :index

        res = @response.parsed_body

        assert_equal 'AD', res['status']
      end
    end
  end
end

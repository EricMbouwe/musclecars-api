require 'rails_helper'

RSpec.describe Admin::CarsController, type: :request do
  describe 'GET #index' do
    context 'if the current user can access cars in the database as an admin' do
      it 'allow our admin user to view cars' do
        user = FactoryBot.build(:user, role: 'admin')

        get '/admin/cars/index'

        assert_response :success
      end

      it 'does not allow our regular user to view cars' do
        user = FactoryBot.build(:user, role: 'user')

        get '/admin/cars/index'

        res = @response.parsed_body

        assert_equal 'AD', res['status']
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Admin::CarsController, type: :controller do
  describe 'GET #index' do
    context 'if the current user can access cars in the database as an admin' do
      it 'allow our admin user to view cars' do
        user = FactoryBot.build(:user, role: 'admin')
        car = FactoryBot.build(:car, name: 'porshe')
        @request.session[:user_id] = user.id

        get :index
        res = @response.parsed_body

        #p res
        #p user
        #p car
        #p session

        assert_response :success
        #assert_equal 'porshe', res[0]['name']
      end

      it 'does not allow our regular user to view cars' do
        user = FactoryBot.build(:user, role: 'user')
        @request.session[:user_id] = user.id
        
        get :index

        res = @response.parsed_body
#
        #p res
        #p session

        assert_equal 'AD', res['status']
        #assert_equal 'you do not belong there (Not an Admin)', res['message']
      end
    end
  end
end
require 'rails_helper'

RSpec.describe Api::V1::CarsController, type: :request do
  let!(:user) { FactoryBot.build(:user, id: 1, name: 'eric', email: 'eri@server.io', password: 'azerty') }

  before do
    3.times { FactoryBot.build(:car) }
  end

  describe 'GET #index' do
    context 'if the there is some cars in the database' do
      it 'get car list index should be success' do
        get '/'

        assert_response :success
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET /cars/1' do
    context 'when logged in' do
      before do
        stub_current_user(user)
        get '/api/v1/cars/2'
      end

      it 'return the car details' do
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'no authorization token' do
      before do
        get '/api/v1/cars/1'
      end

      it 'does not return the car details' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end

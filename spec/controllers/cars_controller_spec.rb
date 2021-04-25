require 'rails_helper'

RSpec.describe Api::V1::CarsController, type: :request do
  before do
    3.times { FactoryBot.build(:car) }
  end

  describe 'GET #index' do
    context 'if the there is some cars in the database' do
      it 'get car list index should be success' do
        get :index
        assert_response :success
      end
    end
  end

  describe 'GET /cars/1' do
    user = FactoryBot.build(:user)

    context 'when logged in' do
      before do
        stub_current_user(user)
        get :show
      end

      it "the car details", :show_in_doc, doc_title: 'Get all todo tasks' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'no authorization token' do
      before do
        get '/api/v1/cars/1'
      end

      it 'returns unauthorized', :show_in_doc, doc_title: 'Unauthorized request' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
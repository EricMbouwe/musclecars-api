require 'rails_helper'

RSpec.describe Api::V1::CarsController, type: :controller do
  describe 'GET #index' do
    context 'if the there is some cars in the database' do
      it 'get car list index should be success' do
        get :index
        assert_response :success
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Api::V1::AppointmentsController, type: :request do
  let!(:user) { FactoryBot.build(:user, id: 1, name: 'eric', email: 'eri@server.io', password: 'azerty') }

  before do
    3.times { FactoryBot.build(:appointment) }
  end

  describe 'GET #index' do
    context 'if the there is some appointments in the database' do
      it 'get car list index should be success' do
        get '/api/v1/users/1/appointments'

        assert_response :success
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'DELETE /cars/1' do
    context 'when logged in' do
      before do
        delete '/api/v1/users/1/appointments/1'
      end

      it 'deletes the record' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end

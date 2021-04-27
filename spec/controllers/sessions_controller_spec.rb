require 'rails_helper'

RSpec.describe SessionsController, type: :request do
  user = FactoryBot.build(:user, id: 1, name: 'eric', email: 'eri@server.io', password: 'azerty')
  before do
    stub_current_user(user)
    login(user)
  end

  describe 'POST #create' do
    it 'logs in the user and returns the user informations' do
      expect(session['user_id']).to eq user.id
    end

    it 'for wrong password return status 401' do
      post '/sessions', params: {
        email: 'wrong email',
        password: 'wrong pwd'
      }

      res = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      assert_equal 401, res['status']
    end

    it 'returns status code 200' do
      assert_response :success
    end
  end

  describe 'GET #logged_in' do
    it 'returns a require login if not logged in' do
      get '/logged_in'

      res = JSON.parse(response.body)
      expect(res['logged_in']).to eq false
      assert_response :success
    end

    it 'returns status code 200' do
      assert_response :success
    end
  end

  describe 'DELETE #destroy' do
    context 'if there is a logged in user' do
      it 'logs out the user' do
        delete '/logout'

        res = JSON.parse(response.body)
        assert_equal 'session destroyed', res['message']
        expect(res['logged_out']).to be true
      end

      it 'returns status code 200' do
        assert_response :success
      end
    end
  end
end

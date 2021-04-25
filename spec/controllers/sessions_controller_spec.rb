require 'rails_helper'

RSpec.describe SessionsController, type: :request do
  #let!(:user) {FactoryBot.build(:user, id: 52, name: 'eric', email: 'eri@server.io', password: 'azerty')}
  user = FactoryBot.build(:user, id: 1, name: 'eric', email: 'eri@server.io', password: 'azerty')
  before do
    login(user)
  end

  describe 'POST #create' do
    it 'logs in the user and returns the user informations' do
      post '/sessions', params: {
        email: user.name,
        password: user.password 
      }

      res = JSON.parse(response.body)
      p res

      expect(res['user']).not_to be_empty
      expect(res['logged_in']).to eq true
      assert_equal 'created', res['status']
    end
    
    it 'returns status code 200' do
      assert_response :success
    end

    it 'for wrong password return status 401' do
      post '/sessions', params: {
        email: 'wrong email',
        password: 'wrong pwd'
      }

      res = JSON.parse(response.body)
      p res
      expect(response).to have_http_status(:ok)
      assert_equal 401, res['status']
    end
  end

  describe 'GET #logged_in' do 
    
    it 'returns the logged_in status' do
      get '/logged_in'
      res = JSON.parse(response.body)
      expect(res['user']).not_to be_empty
      expect(res['logged_in']).to eq true
    end
    
    it 'returns status code 200' do
      assert_response :success
    end
    
    it 'returns a require login if not logged in' do
      get '/logged_in'
      res = JSON.parse(response.body)
      expect(res['logged_in']).to eq false
      assert_response :success
    end
  end

  describe 'DELETE #destroy' do
    context 'if there is a logged in user' do
      it 'logs out the user' do
        delete '/logout'
        res = JSON.parse(response.body)
  
        assert_equal 'session destroyed', res['message']
      end
      
      it 'returns status code 200' do
        assert_response :success
      end
    end

    context 'if there is not a logged in user' do
      it 'respond with a require login' do
        delete '/logout'
        res = JSON.parse(response.body)
  
        assert_equal 'you do not belong there (Not a User)', res['message']
      end
      
      it 'returns status code 200' do
        assert_response :success
      end
    end
  end
end
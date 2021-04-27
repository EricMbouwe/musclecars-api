require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  describe 'POST #create' do
    before do
      post '/api/v1/users', params: {
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: BCrypt::Password.create('azerty')
      }
    end

    it 'returns the new user informations' do
      res = JSON.parse(response.body)

      expect(res['user']).not_to be_empty
      assert_equal 'created', res['status']
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
      assert_response :success
    end
  end
end

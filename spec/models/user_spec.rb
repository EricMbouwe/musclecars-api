require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'associations' do
    it { should have_many(:appointments) }
    it { should have_many(:cars).through(:appointments) }
  end

  it 'is valid with valid attributes' do
    User.create(name: 'cslt', email: 'cslt@serv.io', password: 'azerty')
    expect(User.all.length).to eq(1)
  end
end

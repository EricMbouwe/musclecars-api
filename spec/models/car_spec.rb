require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:description) }
  end

  describe 'associations' do
    it { should have_many(:appointments) }
    it { should have_many(:pictures).dependent(:delete_all) }
    it { should have_many(:users).through(:appointments) }
  end
end
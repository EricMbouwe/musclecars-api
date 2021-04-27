require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:appointment_date) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:car) }
  end
end

FactoryBot.define do
  factory :appointment do
    id { 1 }
    city { Faker::Name.name }
    appointment_date { '24-02-2022' }
  end
end

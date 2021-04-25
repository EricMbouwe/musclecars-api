FactoryBot.define do
  factory :user do
    id { Faker::Number.number(digits: 2) }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { BCrypt::Password.create('azerty') }
    role { 'user' }
  end
end

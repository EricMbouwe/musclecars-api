FactoryBot.define do
  factory :car do
    name { Faker::Name.name }
    price { Faker::Number.number(digits: 3) }
    description { Faker::Lorem.characters(number: 50) }
  end
end

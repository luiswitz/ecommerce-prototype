FactoryBot.define do
  factory :order do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    address { Faker::Address.full_address }
    shipping_mode
  end
end

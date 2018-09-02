FactoryBot.define do
  factory :product do
    description { Faker::Lorem.sentence }
    price { 10.0 }
    image_url { Faker::File.file_name }

    sequence(:title) { |n| "product_#{n}" }
  end
end

FactoryBot.define  do
  factory :shipping_mode do
    sequence(:title) { |n| "shipping_mode_#{n}" }
    price { 5.0 }
  end
end

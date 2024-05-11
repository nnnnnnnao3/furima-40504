FactoryBot.define do
  factory :order_address do
    post_code { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture_id { rand(2..47) }
    municipality { Faker::Address.city }
    street_address { "#{Faker::Address.building_number}#{Faker::Address.street_suffix}" }
    building_name { Faker::Commerce.product_name }
    phone_number { Faker::Number.leading_zero_number(digits: 11) }
  end
end

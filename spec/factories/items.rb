FactoryBot.define do

  factory :item do
    association :user
    item_name                 { Faker::Commerce.product_name }
    description               { Faker::Lorem.paragraph(sentence_count: 3)}
    category_id               { rand(2..10) }
    condition_id              { rand(2..6) }
    shipping_cost_id          { (2) }
    prefecture_id             { rand(2..47) }
    shipping_day_id           { rand(2..3) }
    price                     { Faker::Number.between(from: 300, to: 9999999)}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/furimatest.png'), filename: 'furimatest.png')
    end
  end
end

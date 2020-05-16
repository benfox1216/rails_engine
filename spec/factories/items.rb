FactoryBot.define do
  factory :item do
    association :merchant
    name { Faker::Commerce.product_name }
    description { Faker::Commerce.department }
    unit_price { Faker::Commerce.price }
  end
end
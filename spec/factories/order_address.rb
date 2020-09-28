FactoryBot.define do
  factory :order_address do
    post_code      { "123-4567" }
    prefecture_id  { Faker::Number.within(range: 2..48) }
    city           { "国分寺市" }
    street_number  { "4-4-4" }
    phone_number   { "00000000000" }
  end
end
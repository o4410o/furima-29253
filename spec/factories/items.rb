FactoryBot.define do
  factory :item do
    item_name         { Faker::Name.initials(number: 2) }
    price             { Faker::Number.within(range: 300..9_999_999) }
    detail            { Faker::Lorem.sentences(number: 1) }
    genre_id          { Faker::Number.within(range: 2..11) }
    status_id         { Faker::Number.within(range: 2..7) }
    delivery_id       { Faker::Number.within(range: 2..3) }
    shipping_area_id  { Faker::Number.within(range: 2..48) }
    shipping_date_id  { Faker::Number.within(range: 2..4) }
    association :user
  end
end

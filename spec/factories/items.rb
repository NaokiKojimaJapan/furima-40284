FactoryBot.define do
  factory :item do
    name                  { Faker::Name.initials(number: 2) }
    content               { Faker::Lorem.sentence }
    category_id           { '2' }
    status_id             { '2' }
    shipping_fee_id       { '2' }
    prefecture_id         { '2' }
    shipping_time_id      { '2' }
    price                 { '3000' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end

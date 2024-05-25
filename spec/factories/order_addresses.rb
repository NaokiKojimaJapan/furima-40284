FactoryBot.define do
  factory :order_address do
    postal_code   { '123-4567' }
    prefecture_id { '2' }
    city          { '横浜市青葉区' }
    street        { '美しが丘0丁目0-0-000' }
    phone_number  { '1234567890' }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end

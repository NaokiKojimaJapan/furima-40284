FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { 'あ' }
    last_name             { 'あ' }
    kana_first_name       { 'ア' }
    kana_last_name        { 'ア' }
    birth_date            { Faker::Date.birthday(min_age: 18) }
  end
end

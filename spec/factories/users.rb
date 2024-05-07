FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { "#{Faker::Internet.password(min_length: 6)}1" }
    password_confirmation { password }
    last_name             { 'やマ田' }
    first_name            { '太ろウ' }
    kana_first_name       { 'ヤマダ' }
    kana_last_name        { 'タロウ' }
    birthday              { Faker::Date.birthday }
  end
end

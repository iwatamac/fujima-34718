FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { 'あア阿' }
    first_name            { 'あア阿' }
    last_name_kana        { 'ア' }
    first_name_kana       { 'ア' }
    birthday              { Faker::Date.between_except(from: '2014-09-23', to: '2014-09-25', excepted: '2015-01-24') }
  end
end

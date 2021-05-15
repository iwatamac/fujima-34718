FactoryBot.define do
  factory :item do
    name               { Faker::Name.name }
    description        { Faker::Lorem.sentences }
    category_id        { '1' }
    condition_id       { '1' }
    responsibility_id  { '1' }
    delivery_area_id   { '1' }
    delivery_days_id   { '1' }
    price              { '1000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

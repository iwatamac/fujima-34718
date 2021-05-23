FactoryBot.define do
  factory :order_address do
    postal_code           { '123-4567' }
    prefecture_id         { 1 }
    city                  { '横浜市緑区'}
    house_number          { '青山1-1-1'}
    building_name         { '柳ビル103'}
    phone_number          { '08012345678' }  
    user_id               { 1 }
    item_id               { 1 }
  end
end

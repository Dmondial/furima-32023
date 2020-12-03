FactoryBot.define do
  factory :purchase_form do
    postal_code { '123-4567' }
    prefecture_id { 15 }
    city { '横浜市' }
    house_number { '東京1番地' }
    building_name { 'なんとかbulding' }
    phone_number { '00123456789' }

    token { '0a0a0a' }
    user_id { 1 }
    item_id { 2 }
  end
end

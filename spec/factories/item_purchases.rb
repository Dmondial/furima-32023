FactoryBot.define do
  factory :item_purchase do
    number {4242424242424242}
    month {12}
    year {24}
    code {123}
    postal_code {"123-4567"}
    prefecture_id {15}
    city {"横浜市"}
    house_number {"東京1番地"}
    building_name {"なんとかbulding"}
    phone_number {"00123456789"}

    association :item
    association :user
  end
end

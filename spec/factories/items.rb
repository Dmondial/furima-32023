FactoryBot.define do
  factory :item do
    name { Faker::Name.initials(number: 2) }
    introduction { Faker::Lorem.sentence }
    category_id { 1 }
    condition_id { 1 }
    delivery_fee_id { 1 }
    send_source_id { 1 }
    send_time_id { 1 }
    price { 5000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

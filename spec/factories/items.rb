FactoryBot.define do
  factory :item do
    title { Faker::Lorem.sentence }
    introduction { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
    category_id { Faker::Number.between(from: 2, to: Category.all.length) }
    prefecture_id { Faker::Number.between(from: 2, to: Prefecture.all.length) }
    delivery_charge_id { Faker::Number.between(from: 2, to: DeliveryCharge.all.length) }
    delivery_date_id { Faker::Number.between(from: 2, to: DeliveryDate.all.length) }
    status_id { Faker::Number.between(from: 2, to: Status.all.length) }
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/internet_nft_art.png'), filename: 'internet_nft_art.png')
    end
  end
end

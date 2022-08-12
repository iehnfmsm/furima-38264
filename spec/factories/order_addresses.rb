FactoryBot.define do
  factory :order_address do
    zip { Faker::Lorem.characters(number: 3, min_numeric: 3) + '-' + Faker::Lorem.characters(number: 4, min_numeric: 4) }
    prefecture_id { Faker::Number.between(from: 2, to: Prefecture.all.length) }
    shikuchouson {'横浜市緑区'}
    banchi {'七丁目１２番地３号'}
    building {'富士山ビル'}
    phone_num { Faker::Lorem.characters(number: 10, min_numeric: 10) || Faker::Lorem.characters(number: 11, min_numeric: 11) }
    token {"tok_abcdefghijk00000000000000000"}
  end
end

FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length:6)}
    password_confirmation {password}
    japanese_user = Gimei.name
    last_name {japanese_user.last.kanji}
    first_name {japanese_user.first.kanji}
    last_name_kana {japanese_user.last.katakana}
    first_name_kana {japanese_user.first.katakana}
    birthday {Faker::Date.between(from: '1930-01-01', to: '2017-12-31')}
  end
end

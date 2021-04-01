FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"aaaa11"}
    password_confirmation {password}
    first_name            {"田中"}
    last_name             {"太郎"}
    first_name_katakana   {"タナカ"}
    last_name_katakana    {"タロウ"}
    birthday              {'1999-01-01'}
  end
end
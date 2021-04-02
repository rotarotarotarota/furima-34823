Faker::Config.locale = :ja

FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '1A2B3C4D' }
    password_confirmation { password }
    last_name             { Faker::Name.last_name }
    first_name            { Faker::Name.first_name }
    last_name_kana        { Faker::Base.regexify(/[アイウエオン]{2,6}/) }
    first_name_kana       { Faker::Base.regexify(/[アイウエオン]{2,6}/) }
    date_of_birth         { Date.new(2000, 5, 30) }
  end
end

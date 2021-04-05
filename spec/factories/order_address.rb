FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 5 }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_num { '12345678912' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

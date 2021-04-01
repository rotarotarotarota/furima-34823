FactoryBot.define do
  factory :order do
    address_line      {'123-1234'}
    delivery_area_id  {2}
    city              {'横浜市'}
    block_number      {'1-1'}
    city_bill         {'横浜ビル'}
    phone_number      {'1111111111'}
    token             {"tok_abcdefghijk00000000000000000"}
  end
end
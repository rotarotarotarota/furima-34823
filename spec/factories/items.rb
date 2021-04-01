FactoryBot.define do
  factory :item do
    name     {Faker::Name.initials(number: 2)}
    concept  {"aaaa"}
    category_id {2}
    item_status_id {2}
    delivery_price_id {2}
    delivery_area_id {2}
    delivery_date_id {2}
    price             {1000}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_area
  belongs_to :delivery_price
  belongs_to :delivery_date
  has_one_attached :image
  has_one :user_buy_address

  with_options presence: true do
    validates :name
    validates :concept
    validates :price, inclusion: { in: (300..9999999)}, numericality: {with: /^[0-9]+$/}
    validates :image
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_status_id
    validates :delivery_price_id
    validates :delivery_area_id
    validates :delivery_date_id
  end
end

class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge_type
  belongs_to :prefecture
  belongs_to :shipment_date

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :charge_type_id
      validates :prefecture_id
      validates :shipment_date_id
    end
    validates :price, numericality: { greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999, message: "は300~9,999,999の範囲の半角数字での入力が必要"}
  end
end
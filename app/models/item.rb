class Item < ApplicationRecord
  with_options presence: true do
    validates :image, :title, :description
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_date_id
    end
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'must be a half-width number between 300 and 9,999,999' }
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_date
end

class CreateBuyAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :buy_addresses do |t|
      t.string :address_line,         null: false
      t.integer :delivery_area_id,    null: false
      t.string :city,                 null: false
      t.string :block_number,         null: false
      t.string :city_bill
      t.string :phone_number,         null: false
      t.references :user_buy_address, null: false, foreign_key: true
      t.timestamps
    end
  end
end

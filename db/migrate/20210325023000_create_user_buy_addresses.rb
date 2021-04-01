class CreateUserBuyAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_buy_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end

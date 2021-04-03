require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe "商品出品" do
    context '出品できる時' do
      it "全ての項目に正しく入力されていれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '出品できない時' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空だと登録できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idが1だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが1だと登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "charge_type_idが1だと登録できない" do
        @item.charge_type_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge type can't be blank")
      end
      it "prefecture_idが1だと登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "shipment_date_idが1だと登録できない" do
        @item.shipment_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment date can't be blank")
      end
      it "priceが空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300未満だと登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は300~9,999,999の範囲の半角数字での入力が必要")
      end
      it "priceが9,999,999より大きいと登録できない" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price は300~9,999,999の範囲の半角数字での入力が必要")
      end
      it "priceは全角だ登録できない" do
        @item.price = "５０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は300~9,999,999の範囲の半角数字での入力が必要")
      end
      it "priceは半角英数混合では登録できない" do
        @item.price = "5000a"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は300~9,999,999の範囲の半角数字での入力が必要")
      end
      it "priceは半角英数だけでは登録できない" do
        @item.price = "abcdefg"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は300~9,999,999の範囲の半角数字での入力が必要")
      end
      it "userが紐づいていないと登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end

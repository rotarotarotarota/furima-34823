require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも登録できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeがハイフン無しだと保存できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code はハイフン入りでの入力が必要')
      end
      it 'postal_codeの数字部分が半角数字以外だと保存できない' do
        @order_address.postal_code = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code はハイフン入りでの入力が必要')
      end
      it 'postal_codeのハイフンの位置が郵便番号の決まりと違う位置にあると保存できない' do
        @order_address.postal_code = '12-34567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code はハイフン入りでの入力が必要')
      end
      it 'prefecture_idが1だと保存できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numが空だと保存できない' do
        @order_address.phone_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'phone_numが12桁以上だと保存できない' do
        @order_address.phone_num = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone num は11桁以内の数字での入力が必要')
      end
      it 'phone_numが半角数字以外だと保存できない' do
        @order_address.phone_num = '１２３４５６７８９０１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone num は11桁以内の数字での入力が必要')
      end
      it 'phone_numが半角数字はあるが、他の文字が混ざっている' do
        @order_address.phone_num = '1234ab78901'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone num は11桁以内の数字での入力が必要')
      end
      it 'ユーザーのidが存在しない場合購入できない' do
        @order_address.user_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it '商品のidが存在しない場合購入できない' do
        @order_address.item_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

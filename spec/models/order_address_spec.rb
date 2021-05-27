require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: [:user], item_id: [:item])

    sleep 1
  end

  describe 'クレジットカード情報と配送先入力' do
    context '商品を購入できるとき' do
      it 'すべての値が正しく入力できていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも保存ができる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品を購入できないとき' do
      it 'postal_codeが空だと保存できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code can't be blank",
                                                               'Postal code is invalid. Enter it as follows (e.g. 123-4567)'
      end
      it 'postal_codeはハイフンがないと保存できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Postal code is invalid. Enter it as follows (e.g. 123-4567)'
      end
      it 'postal_codeは全角数字では保存できない' do
        @order_address.postal_code = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Postal code is invalid. Enter it as follows (e.g. 123-4567)'
      end
      it 'postal_codeは全角文字では保存できない' do
        @order_address.postal_code = 'あああああああ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Postal code is invalid. Enter it as follows (e.g. 123-4567)'
      end
      it 'postal_codeは半角英語では保存できない' do
        @order_address.postal_code = 'aaaaaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Postal code is invalid. Enter it as follows (e.g. 123-4567)'
      end
      it 'postal_codeは英数字混合では保存できない' do
        @order_address.postal_code = '123-aaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Postal code is invalid. Enter it as follows (e.g. 123-4567)'
      end
      it 'postal_codeはハイフンの左側が3桁でないと保存できない' do
        @order_address.postal_code = '12-3456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Postal code is invalid. Enter it as follows (e.g. 123-4567)'
      end
      it 'postal_codeはハイフンの右側が4桁でないと保存できない' do
        @order_address.postal_code = '123-45678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Postal code is invalid. Enter it as follows (e.g. 123-4567)'
      end
      it 'prefecture_idのidが0では保存できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'cityが空では保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end
      it 'house_numberが空では保存できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "House number can't be blank"
      end
      it 'phone_numberが空では保存できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが9桁では保存できない' do
        @order_address.phone_number = '111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is too short'
      end
      it 'phone_numberが12桁以上では保存できない' do
        @order_address.phone_number = '111111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is too short'
      end
      it 'phone_numberが全角数字では保存できない' do
        @order_address.phone_number = '１１１１１１１１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid. Input only number'
      end
      it 'phone_numberが半角英語では保存できない' do
        @order_address.phone_number = 'aaaaaaaaaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid. Input only number'
      end
      it 'phone_numberが英数字混合では保存できない' do
        @order_address.phone_number = '１１１１1111aaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid. Input only number'
      end
      it 'userが紐づいていなければいけない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐づいていなければいけない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end
      it 'tokenが空だと保存できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end

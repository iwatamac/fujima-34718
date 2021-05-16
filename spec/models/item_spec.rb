require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができる場合' do
      it 'name, description, category_id, condition_id, responsibility_id, delivery_area_id, delivery_days_id, price, image, が入力されてれば出品できる' do
        expect(@item).to be_valid
      end
      it 'nameが40文字以下なら出品できる' do
        @item.name = 'a' * 40
        expect(@item).to be_valid
      end
      it 'descriptionが1000文字以下なら保存できる' do
        @item.description = 'a' * 1000
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない場合' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'category_idのidが0なら出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 0'
      end
      it 'condition_idのidが0なら出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Condition must be other than 0'
      end
      it 'responsibility_idのidが0なら出品できない' do
        @item.responsibility_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Responsibility must be other than 0'
      end
      it 'delivery_area_idのidが0なら出品できない' do
        @item.delivery_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery area must be other than 0'
      end
      it 'delivery_days_idのidが0なら出品できない' do
        @item.delivery_days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery days must be other than 0'
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが全角数字では出品できない' do
        @item.price = '９９９'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is out of setting range',
                                                      'Price is invalid. Input half-width characters'
      end
      it 'priceが全角文字では出品できない' do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is out of setting range',
                                                      'Price is invalid. Input half-width characters'
      end
      it 'priceが英数字混合では出品できない' do
        @item.price = '999aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid. Input half-width characters'                                                
      end
      it 'priceが半角英語では出品できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is out of setting range',
                                                      'Price is invalid. Input half-width characters'
      end
      it 'priceが299以下の場合は保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it 'priceが10,000,000以上の場合は保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'ユーザーに紐づいていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end

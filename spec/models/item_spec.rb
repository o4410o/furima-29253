require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.item_image = fixture_file_upload('/files/hero.jpg')
  end

  describe '商品出品機能' do
    context '商品出品ができるとき' do
      it '画像とitem_name,price,detaol,genre_id,status_id,delivery_id,shipping_area_id,shipping_date_idがあれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品ができないとき' do
      it 'item_nameが空の時' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'detailが空の時' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it 'genre_idが１の時' do
        @item.genre_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Genre must be other than 1')
      end
      it 'status_idが１の時' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it 'delivery_idが１の時' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery must be other than 1')
      end
      it 'shipping_area_idが１の時' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping area must be other than 1')
      end
      it 'shipping_date_id' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping date must be other than 1')
      end
      it 'priceがからの時' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number', 'Price is not a number')
      end
      it 'priceが300より小さい時' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが9999999より大きい時' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end

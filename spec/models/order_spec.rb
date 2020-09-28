require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order_address)
  end

  describe '商品購入' do
    context '商品購入ができる時' do
      it 'number,exp_month,exp_yesr,cvc,post_code,prefecture_id,city,street_number,phone_numberがあれば購入できる' do
        expect(@order).to be_valid
      end
    end

    context '商品購入ができない時' do
      it 'tokenが空の時' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空の時' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeのハイフンがない時' do
        
      end
      it 'prefecture_idが１の時' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが空の時' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'street_numberが空の時' do
        @order.street_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Street number can't be blank")
      end
      it 'phone_numberが空の時' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  
  end
end

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
    end
  
  end
end

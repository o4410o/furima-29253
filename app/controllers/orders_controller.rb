class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])

  end

  def new
    @order = Orderaddress.new
  end 

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(address_params)

    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end 
  end

  private
  def address_params
    params.permit(:item_id, :post_code, :prefecture_id, :city, :street_number, :building, :phone_number, :token).merge(user_id: current_user.id)
    
  end
  def order_params
    params.permit(:token)
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],   
      currency:'jpy'                 
    )
  end
end

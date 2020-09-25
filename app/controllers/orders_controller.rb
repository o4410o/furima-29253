class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])

  end

  def create
    @item = Item.find(params[:item_id])
    # @order = @item.order.new(order_params)
    # if @order.valid?
      pay_item
      # @order.save
      return redirect_to root_path
    # else
      render 'index'
    # end 
  end

  private

  def order_params
    params.permit(:token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_9dc24135d946d3c3b23cd76d"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],    
      currency:'jpy'                 
    )
  end


end

class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    # #@genre = Genre.find(params[:id])
    # @genre = Genre.find_by(name: params[:name])
    # @genre = Item.find_by(params[:genre_id])
    # @genre = Genre.find(params[:id])
    # @genre = Item.find_by(genre_id: params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_image, :price, :detail, :genre_id, :status_id, :delivery_id, :shipping_area_id, :shipping_date_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end

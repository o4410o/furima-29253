class ItemsController < ApplicationController

  def index
    @items = User.all
  end
end

class Public::ItemsController < ApplicationController
  def index
  end

  def show
  end


  private
  def item_params
    params.require(:item).permit(:item_name, :item_ex, :image, :price, :goods_genre_id, :count)
  end

end

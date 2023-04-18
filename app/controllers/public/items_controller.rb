class Public::ItemsController < ApplicationController
  def index
    @items= Item.all
    @goods_genres = GoodsGenre.all
  end

  def show
    @item = Item.find(params[:id])
  end


  private
  def item_params
    params.require(:item).permit(:item_name, :item_ex, :image, :price, :goods_genre_id, :count)
  end

end

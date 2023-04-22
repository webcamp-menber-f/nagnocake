class Public::ItemsController < ApplicationController
   before_action :authenticate_customer!, only: [:show,:index]
 def index
    @items = Item.page(params[:page]).per(10)
    @goods_genres = GoodsGenre.page(params[:page])
       @item = Item.find_by(id: params[:id])
    if params[:goods_genre_id].present?
      @goods_genre = GoodsGenre.find(params[:goods_genre_id])
      @items = @goods_genre.items.page(params[:page]) if @goods_genre.present?
    end
 end

  def show
    @item = Item.find(params[:id])
    @cart = Cart
  end


  private
  def item_params
    params.require(:item).permit(:item_name, :item_ex, :image, :price, :goods_genre_id, :count)
  end

end

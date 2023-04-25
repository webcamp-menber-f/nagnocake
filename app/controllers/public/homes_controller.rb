class Public::HomesController < ApplicationController
  def top
    @new_items = Item.recent.limit(4)
    @goods_genres = GoodsGenre.page(params[:page])
  end
  
  def about
  end
 
end

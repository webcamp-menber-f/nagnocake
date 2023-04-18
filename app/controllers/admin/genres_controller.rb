class Admin::GenresController < ApplicationController

  def index
     @items=Item.all
    @goods_genres = GoodsGenre.all
    if params[:goods_genre_id].present?
      @goods_genre = Goods_genre.find(params[:goods_genre_id])
      @products = @goods_genre.products
    end
  end
  
  def create
  end
  
  def edit
  end
  
  def update
  end

end

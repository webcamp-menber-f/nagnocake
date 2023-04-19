class Admin::GoodsGenresController < ApplicationController

  def index
    @items=Item.all
    @goods_genres = GoodsGenre.all
    @item = GoodsGenre.find(params[:goods_genre_id]).item if params[:goods_genre_id].present?
    @goods_genre = GoodsGenre.new
  end

  def create
    @goods_genre = GoodsGenre.new(goods_genre_params)
    @goods_genre.save
  end

  def edit
    @goods_genre = Goods_genre.find(params[:id])
  end

  def update
    @goods_genre = Goods_genre.find(params[:id])
    if @goods_genre.update(goods_genre_params)
      redirect_to admin_goods_genre_path(@goods_genre),  notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  private

  def goods_genre_params
    params.require(:goods_genre).permit(:genre_name)
  end
end


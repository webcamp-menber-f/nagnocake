class Admin::GoodsGenresController < ApplicationController

 before_action :authenticate_admin!

  def index
    @items=Item.all
    @goods_genres = GoodsGenre.all
    @item = GoodsGenre.find(params[:goods_genre_id]).item if params[:goods_genre_id].present?
    @goods_genre = GoodsGenre.new
  end

  def create
    @goods_genre = GoodsGenre.new(goods_genre_params)
    @goods_genre.save
          redirect_to admin_goods_genres_path
  end

  def edit
    @goods_genre = GoodsGenre.find(params[:id])
  end

  def update
    @goods_genre = GoodsGenre.find(params[:id])
    if @goods_genre.update(goods_genre_params)
      redirect_to admin_goods_genres_path
    else
      render edit
    end
  end

  def destroy
    @goods_genre = GoodsGenre.find(params[:id])
    @goods_genre.destroy
      redirect_to admin_goods_genres_path
  end

  private

  def goods_genre_params
    params.require(:goods_genre).permit(:genre_name)
  end
end


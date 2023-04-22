class Admin::ItemsController < ApplicationController

 before_action :authenticate_admin!
 
  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
       redirect_to admin_item_path(@item), notice: "You have updated book successfully."
    else
       render new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
      redirect_to admin_items_path, notice: "Item was successfully deleted."
  end


 private
  def item_params
    params.require(:item).permit(:item_name, :item_ex, :image, :price, :goods_genre_id, :status)
  end
 end
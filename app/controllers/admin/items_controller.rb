class Admin::ItemsController < ApplicationController

  def index
  end
  
  def new
  end
  
  def create
  end
  
  def show
  end
  
  def edit
  end

  def update
  end
  
  private
  def item_params
    params.require(:item).permit(:item_name, :item_ex, :image, :price, :goods_genre_id, :status) 
  end
  
end

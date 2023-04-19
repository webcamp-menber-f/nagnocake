class Public::CartItemsController < ApplicationController
 before_action :authenticate_customer!
 
  def index
  @cart = current_customer.cart.all
  end

  def update
  end
  
  def destroy
    cart_item = Cart.find(params[:id])
    cart_item.destroy
    @cart_items = Cart.all
     render 'index'
  end
  
  def destroy_all
    cart_items = Cart.all
    cart_items.destroy_all
     render 'index'
  end
  
  
  def create
    @cart_item = current_customer.cart.new(cart_params)
    if current_customer.cart.find_by(item_id: params[:cart_item] [:item_id]).present?
      cart_item = current_customer.cart.find_by(item_id: params[:cart_item][:item_id])
      cart_item.count += params[:cart_item][:count].to_i
      cart_item.save
      redirect_to cart_items_path
      
    elsif @cart_item.save
        @cart_items = current_customer.cart.all
        render 'index'
    else
       render 'index'
    end
  end
    

private

 def cart_item_params
   params.require(:cart_item).permit(:item_id,:price,:count,:image,:item_name)
 end

end

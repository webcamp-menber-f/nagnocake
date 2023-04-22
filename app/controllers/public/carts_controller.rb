class Public::CartsController < ApplicationController
 before_action :authenticate_customer!

  def index
  @cart = current_customer.carts
  end

  def update
    @cart_item = current_customer.carts.find(params[:id])
    @cart_item.update(count: params[:cart][:count])
    redirect_to carts_path
  end


  def destroy
    cart_item = Cart.find(params[:id])
    cart_item.destroy
     redirect_to carts_path
  end

  def destroy_all
    cart_items = Cart.all
    cart_items.destroy_all
     render 'index'
  end


  def create
    @cart_item = current_customer.carts.new(cart_item_params)
    if current_customer.carts.find_by(item_id: params[:cart] [:item_id]).present?
      cart_item = current_customer.carts.find_by(item_id: params[:cart][:item_id])
      cart_item.count += params[:cart][:count].to_i
      cart_item.save
      redirect_to carts_path
    elsif @cart_item.save
        redirect_to carts_path
    else
       @cart = current_customer.carts.all
       render 'index'
    end
  end


private
 def cart_item_params
   params.require(:cart).permit(:item_id,:price,:count,:image,:item_name)
 end

end

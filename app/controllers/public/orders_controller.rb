class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = Address.all
  end

  def create
    #Room fでは、cartでの名前で作成していますがわかりやすいようにあえてcart_itemにしています。
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.save
    @carts = current_customer.carts.all
      @carts.each do |cart|
        @order_item = OrderItem.new
        @order_item.order_id = order.id
        @order_item.item_id = cart.item.id
        @order_item.money = cart.item.price
        @order_item.count = cart.count
        @order_item.status = 0
        @order_item.save!
      end

    Cart.destroy_all
    redirect_to orders_complete_path

  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_number] == "0"
      @order.postal_code = current_customer.post
      @order.name = current_customer.first_name + current_customer.last_name
      @order.place = current_customer.place
    elsif params[:order][:address_number] == "1"
      #binding.pry
      if Address.exists?(id: params[:order][:registered])
        @order.name = Address.find(params[:order][:registered]).name
        @order.place = Address.find(params[:order][:registered]).place
        @order.postal_code = Address.find(params[:order][:registered]).postal_code

      else
        render :new
      end
    elsif params[:order][:address_number] == "2"
      address_new = current_customer.addresses.new(address_params)
      if address_new.save
      else
        render :new
      end

    end
    @carts = current_customer.carts
    @order_new = Order.new
  end

  def complete
  end


  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])

   # @order_items = OrderItem.where(order_id: params[:id])
    #binding.pry
  end

 private

  def order_params
    params.require(:order).permit(:name, :place, :total_price, :pay, :postage, :postal_code, :customer_id)
  end

  def address_params
    params.require(:order).permit(:name, :place, :postal_code)
  end

  def cartitem_nill
    carts = current_customer.caers
    if cart.blank?
      redirect_to carts_path
    end
  end
end
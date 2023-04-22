class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    cart_item = current_customer.cart.all
    #Room fでは、cartでの名前で作成していますがわかりやすいようにあえてcart_itemにしています。
    @order = current_customer.orders.new(order_params)
    if @order.save
        cart_item.each do |cart|
        order_item = OrderItem.new
        order_item.item_id = cart.item_id
        order_item.order_id = @order.id
        order_item.order_quantiy =cart.count
        order_item.order_price = cart.item.price
        order_item.save
    end
        redirect_to orders_confirm_path
        cart_item.destroy_all
    else
        @order = Order.new(order_params)
        render :new
    end
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_number] == "0"
      @order.name = current_customer.first_name
      @order.place = current_customer.place
    elsif params[:order][:address_number] == "1"
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
    else
    redirect_to customers_mypage_path
    end
    @carts = current_customer.carts.all
    @tatal = @carts.inject(0) { |sum, item| sum + item.sum_price }
  end

  def complete
  end


  def index
  end

  def show
  end

 private

  def order_params
    params.require(:order).permit(:name, :place, :totlal_price)
  end

  def address_params
    params.require(:order).permit(:name, :place, :postal_code)
  end
end
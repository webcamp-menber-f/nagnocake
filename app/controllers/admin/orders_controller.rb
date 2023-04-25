class Admin::OrdersController < ApplicationController

 before_action :authenticate_admin!

  def index
    @orders = Order.all.page(params[:page]).per(10)
  end
  
  def history
    @orders = Customer.find(params[:id]).orders.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      if @order.status == :payment_confrimation
       @order.order_items.each do |order_item|
        order_item.update(status: :waiting_for_production)
       end
      end
      redirect_to admin_order_path(@order)
    else
      render :show
    end
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end


end

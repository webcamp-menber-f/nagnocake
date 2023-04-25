class Admin::OrderItemsController < ApplicationController

  def update
    order_item = OrderItem.find(params[:id])
    if order_item.update(order_item_params)
      if order_item.status == OrderItem.statuses[:in_production]
        order = order_item.order
        order.update(status: OrderItem.statuses[:in_production])
      elsif order_item.status == OrderItem.statuses[:completon_of_production]
        order = order_item.order
        order_in_production = OrderItem.statuses[:in_production]
        order_wating_for_production = OrderItem.statuses[:waiting_for_production]
        if order.order_items.exists?(status: [order_in_production, order_wating_for_production]) == false
          order.update(status: OrderItem.statuses[:preparing_to_ship])
        end
      end
      redirect_to admin_order_path(order_item.order)
    else
      render :show
    end
  end

  private

  def order_item_params
    params.require(:order_item).permit(:status)
  end

end

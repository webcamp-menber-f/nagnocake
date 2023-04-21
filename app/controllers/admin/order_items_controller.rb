class Admin::OrderItemsController < ApplicationController

  def update
    order_item = OrderItem.find(params[:id])
    if order_item.update(order_item_params)
      if order_item.status == :in_production
        order = order_item.order
        order.update(status: :in_production)
      elsif order_item.status == :completon_of_production
        order = order_item.order
        if order.order_items.where(status: [:in_production, :waiting_for_production]).count == 0
          order.update(status: :preparing_to_ship)
        end
      end
      flash[:notice] = "製作ステータスを更新しました。"
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

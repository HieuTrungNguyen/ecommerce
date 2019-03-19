class OrderItemsController < ApplicationController
  def index
    @order_items = OrderItem.find_by_order_id params[:order_id]
  end
end

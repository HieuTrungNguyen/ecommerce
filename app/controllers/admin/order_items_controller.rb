class Admin::OrderItemsController < ApplicationController
  before_action :logged_in_user, :verify_admin
  before_action :load_order, :load_order_customer, only: [:index]

  def index
    @order_items = OrderItem.includes(:product).find_by_order_id params[:order_id]
  end

  private
  def load_order
    @order = Order.find_by id: params[:order_id]
    render_404 unless @order
  end

  def load_order_customer
    @order = Order.find_by id: params[:order_id]
    render_404 unless @order
  end
end

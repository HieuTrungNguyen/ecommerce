class Admin::OrdersController < ApplicationController
  before_action :logged_in_user, :verify_admin
  before_action :load_order, only: [:approve, :reject]
  before_action :load_orders, only: [:index, :approve, :reject]

  def index; end

  def approve
    @order.approved!
    OrderMailer.approve_order(@order).deliver_now
    respond_to do |format|
      format.json {}
      format.js {}
    end
  end

  def reject
    @order.rejected!
    OrderMailer.reject_order(@order).deliver_now
    respond_to do |format|
      format.json {}
      format.js {}
    end
  end

  private
  def load_order
    @order = Order.find_by id: params[:id_order]
    render_404 unless @order
  end

  def load_orders
    @orders = Order.newest.paginate page: params[:page], per_page: Settings.per_page
  end
end

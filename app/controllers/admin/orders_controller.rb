class Admin::OrdersController < ApplicationController
  before_action :logged_in_user, :verify_admin

  def index
    @orders = Order.newest.paginate page: params[:page], per_page: Settings.per_page
  end
end

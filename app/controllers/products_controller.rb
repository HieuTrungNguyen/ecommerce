class ProductsController < ApplicationController
  before_action :load_products, only: [:search]
  before_action :load_categories, only: [:index]

  def index
    @products = Product.load_product_by_category(params[:category_id])
      .paginate page: params[:page], per_page: Settings.per_page
    render "static_pages/home"
  end

  def search
    respond_to do |format|
      format.html {render "static_pages/home"}
      format.json {head :no_content}
      format.js
    end
  end

  private
  def load_products
    @products = Product.find_by_name(params[:search]).order_by_id
      .paginate page: params[:page], per_page: Settings.per_page
  end
end

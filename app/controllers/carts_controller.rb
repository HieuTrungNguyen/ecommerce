class CartsController < ApplicationController
  before_action :current_cart
  before_action :load_product, except: [:index]
  before_action :load_products_list, only: [:index]

  def index; end

  def add_cart
    if session[:cart].key? @product.id.to_s
      session[:cart][@product.id.to_s] += Settings.quantity.default
    else
      session[:cart][@product.id.to_s] = Settings.quantity.default
    end
    redirect_to root_url
  end

  private
  def load_product
    @product = Product.find_by id: params[:id_product]
    render_404 unless @product
  end

  def load_products_list
    @products = Product.load_product_by_ids session[:cart].keys
  end
end

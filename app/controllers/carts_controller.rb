class CartsController < ApplicationController
  before_action :set_cart
  before_action :load_product, except: [:index]
  before_action :current_cart, only: [:index]

  def index; end

  def add_cart
    if session[:cart].key? @product.id.to_s
      session[:cart][@product.id.to_s] += Settings.quantity.default
    else
      session[:cart][@product.id.to_s] = Settings.quantity.default
    end
    redirect_to root_url
  end

  def remove_cart
    session[:cart].delete @product.id.to_s if session[:cart].key?(@product.id.to_s)
    redirect_to carts_url
  end

  private
  def load_product
    @product = Product.find_by id: params[:id_product]
    render_404 unless @product
  end

  def current_cart
    @product_of_current_cart = Product.load_product_by_ids session[:cart].keys
    @product_of_current_cart.each do |item|
      item.quantity_in_cart = session[:cart][item.id.to_s]
    end
  end
end

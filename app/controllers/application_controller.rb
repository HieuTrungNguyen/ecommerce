class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include CartsHelper

  def render_404
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = t "must_login"
      redirect_to root_url
    end
  end

  def verify_admin
    redirect_to root_url unless logged_in? && current_user.admin?
  end

  def current_cart
    @product_of_current_cart = Product.load_product_by_ids session[:cart].keys
  end

  def quantity_in_cart
    @product_of_current_cart.each do |item|
      item.quantity_in_cart = session[:cart][item.id.to_s]
    end
  end
end

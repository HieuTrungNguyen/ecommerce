module CartsHelper
  def set_cart
    @cart = session[:cart] ||= {}
  end

  def total_price_of_cart
    @product_of_current_cart.map do |product|
      product.price * product.quantity_in_cart
    end
  end
end

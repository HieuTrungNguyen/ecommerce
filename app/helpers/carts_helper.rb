module CartsHelper
  def set_cart
    @cart = session[:cart] ||= {}
  end
end

module CartsHelper
  def current_cart
    @cart = session[:cart] ||= {}
  end
end

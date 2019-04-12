module ProductsHelper
  def is_orders_with_in_progress? product_id
    Order.by_product_id(product_id).present?
  end
end

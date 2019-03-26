class StaticPagesController < ApplicationController
  def home
    @products = Product.load_product.order_by_id.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def cart; end
end

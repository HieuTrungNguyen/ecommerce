class StaticPagesController < ApplicationController
  def home
    @products = Product.paginate page: params[:page]
  end

  def cart; end
end

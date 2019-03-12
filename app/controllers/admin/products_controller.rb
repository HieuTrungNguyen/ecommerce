class Admin::ProductsController < ApplicationController
  before_action :load_product, except: [:new, :create, :index]
  before_action :load_categories, except: [:index, :destroy]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t ".create_success"
      redirect_to admin_products_url
    else
      render :new
    end
  end

  def index; end

  def show; end

  def edit; end

  def update
    if @product.update_attributes product_params
      flash[:success] = t ".update_success"
    else
      flash[:danger] = t ".update_failed"
    end
    redirect_to admin_products_url
  end

  private
  def product_params
    params.require(:product).permit :category_id, :name, :description, :image,
      :price, :quantity
  end

  def load_product
    @product = Product.find_by id: params[:id]
    render_404 unless @product
  end

  def load_categories
    @categories = Category.all.map {|x| x.name}
  end
end

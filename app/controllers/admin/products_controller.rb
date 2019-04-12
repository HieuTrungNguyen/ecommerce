class Admin::ProductsController < ApplicationController
  before_action :logged_in_user, :verify_admin
  before_action :load_product, except: [:new, :create, :index]
  before_action :load_products, only: [:index]
  before_action :load_categories, except: [:index, :destroy]
  before_action :load_orders_with_in_progress, only: [:destroy]

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

  def destroy
    ActiveRecord::Base.transaction do
      if @orders.present?
        @orders.each do |order|
          order.rejected!
        end
      end
      @product.inactive!
      respond_success
    end
  rescue
    respond_error
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

  def load_products
    @products = Product.active.order_by_id
      .paginate page: params[:page], per_page: Settings.per_page
  end

  def load_orders_with_in_progress
    @orders = Order.by_product_id params[:id]
  end

  def respond_success
    respond_to do |format|
      format.json {}
      format.html {redirect_to admin_products_url}
      format.js {}
    end
  end

  def respond_error
    respond_to do |format|
      format.json {render json: {message: t("error")}, status: :unprocessable_entity}
      format.html {redirect_to admin_products_url}
      format.js {}
    end
  end
end

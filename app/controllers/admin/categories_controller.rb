class Admin::CategoriesController < ApplicationController
  before_action :verify_admin
  before_action :load_category, except: [:new, :create, :index]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t ".create_success"
      redirect_to admin_categories_url
    else
      render :new
    end
  end

  def index
    @categories = Category.paginate page: params[:page]
  end

  def show; end

  def edit; end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".update_success"
    else
      flash[:danger] = t ".update_failed"
    end
    redirect_to admin_categories_url
  end

  def destroy
    if @category.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".delete_failed"
    end
    redirect_to admin_categories_url
  end

  private
  def load_category
    @category = Category.find_by id: params[:id]
    render_404 unless @category
  end

  def category_params
    params.require(:category).permit :name
  end
end

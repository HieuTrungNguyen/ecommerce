class UsersController < ApplicationController
  before_action :load_user, except: [:new, :create, :index]
  before_action :logged_in_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".create_success"
      log_in @user
      redirect_to @user
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show; end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".update_success"
      redirect_to @user
    else
      flash[:danger] = t ".update_failed"
      redirect_back fallback_location: root_path
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation,
      :phone, :address, :city, :country
  end

  def load_user
    @user = User.find_by id: params[:id]
    render_404 unless @user
  end
end

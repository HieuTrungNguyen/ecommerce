class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include CartsHelper

  def render_404
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = t "must_login"
      redirect_to root_url
    end
  end

  def verify_admin
    redirect_to root_url unless logged_in? && current_user.admin?
  end
end

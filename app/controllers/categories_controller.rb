class CategoriesController < ApplicationController
  before_action :load_categories, only: [:index]

  def index; end
end

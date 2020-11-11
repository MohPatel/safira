class CategoryController < ApplicationController
  def index
    @products = Product.includes(:category).all.page(params[:page])
  end
end

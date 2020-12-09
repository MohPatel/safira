class ProductController < ApplicationController
  def index
    @products = Product.includes(:category).all.page(params[:page])
  end
  def show
    @products = Product.find(params[:id])
  end
  def filter
 end
end

class ProductController < ApplicationController
  add_breadcrumb "home", :root_path
  add_breadcrumb "category", :root_path
  add_breadcrumb "products", :category_index_path
  add_breadcrumb "product", :product_path
  def index
    @products = Product.all.page(params[:page])
  end
  def show
    @products = Product.find(params[:id])
  end
 def filter
 end
end

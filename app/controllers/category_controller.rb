class CategoryController < ApplicationController
  add_breadcrumb "home", :root_path
  add_breadcrumb "category", :root_path
  add_breadcrumb "products", :category_index_path
  def index
    @products = Product.includes(:category).all.page(params[:page])
  end
  def search
   @products ||= find_products
  end
  private
  def find_products
    wildcard_search = "%#{params[:keywords]}%"
    category_id = params[:category_id]
    # products = Product.where("name Like ?", wildcard_search)
    if params[:category_id]!= ""
      products = Product.where(category_id: category_id)
      products =  products.where("name Like ?", wildcard_search)
    else
      products = Product.where("name Like ?", wildcard_search)
  end
end

end

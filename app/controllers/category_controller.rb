class CategoryController < ApplicationController
  def index
    @products = Product.includes(:category).all.page(params[:page])
  end
  def search
    # wildcard_search = "%#{params[:keywords]}%"
    # @products = Product.where("name Like ?", wildcard_search)
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

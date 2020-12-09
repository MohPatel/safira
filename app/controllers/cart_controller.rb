class CartController < ApplicationController
  def create
    logger.debug("Adding #{params[:id]} to the cart")
    id = params[:id].to_i
    quantity = params[:quantity]
    logger.debug("Quantity #{params[:quantity]} to the cart")
    unless session[:shopping_cart].include?(id)
      session[:shopping_cart] << id
      session[:quantity] = quantity
      product = Product.find(id)
      flash[:notice] = "#{product.name} are added into cart"
    end
    redirect_to root_path
  end

  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    session[:quantity] = 0
    product = Product.find(id)
    flash[:notice] = "#{product.name} are removed into cart"
    redirect_to root_path
  end

  def show
  end
end

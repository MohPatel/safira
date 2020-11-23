class CartController < ApplicationController
  def create
    logger.debug("Adding #{params[:id]} to the cart")
    id = params[:id].to_i
    unless session[:shopping_cart].include?(id)
      session[:shopping_cart] << id
      product = Product.find(id)
      flash[:notice] = "#{product.name} are added into cart"
    end
    redirect_to root_path
  end

  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    product = Product.find(id)
    flash[:notice] = "#{product.name} are removed into cart"
    redirect_to root_path
  end
end

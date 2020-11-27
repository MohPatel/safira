class ApplicationController < ActionController::Base
before_action :initialize_session
helper_method :cart
  private
  def initialize_session
    session[:quantity] ||= 0
    session[:shopping_cart] ||= []
    session[:name] ||= ""
    session[:email] ||= ""
    session[:address] ||= ""
    session[:customer] = ""
  end

  def cart
    if session[:shopping_cart]!= ""
      Product.find(session[:shopping_cart])
  end
end
end

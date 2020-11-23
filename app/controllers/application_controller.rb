class ApplicationController < ActionController::Base
before_action :initialize_session
before_action :increment_visit_count
helper_method :visit_count
helper_method :cart
  private
  def initialize_session
    session[:visit_count] ||= 0
    session[:shopping_cart] ||= []
  end

  def increment_visit_count
    session[:visit_count] += 1
  end

  def visit_count
    @visit_count = session[:visit_count]
  end

  def cart
    Product.find(session[:shopping_cart])
  end
end

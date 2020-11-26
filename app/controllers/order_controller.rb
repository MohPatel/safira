class OrderController < ApplicationController
  def index
    @provinces = Province.all
  end

  def create
    province = Province.find(params[:province_id])
    logger.debug("#{province.name} ")
    customer = province.customers.create(name: params[:name], email: params[:email], address: params[:address])
    if customer&.valid?
      sum = 0
      @customers = Customer.find(customer.id)
      session[:customer] = @customers.id
      quantity = 1
      if cart.present?
        cart.each do |product|
          sum = sum + (quantity * product.price.to_i)
          logger.debug("****************#{sum} ")
        end
        cart.each do |product|
          order = customer.orders.create(totalamount: sum, status: "Pending")
          ProductOrder.create(product: product, order: order)
        end
      end
    end
    redirect_to order_invoice_path
  end
  def invoice
    logger.debug("****************#{session[:customer]} ")
    @customer = Customer.find(session[:customer])
  end
  private
  def totalamount
    sum = 0
    if cart.present?
      cart.each do |product|
        sum = sum + product.price.to_i
      end
  end
end
end

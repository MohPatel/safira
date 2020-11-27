class OrderController < ApplicationController
  before_action :authenticate_user!, except: [:invoice]
  before_action :initialize_session

  def index
    @provinces = Province.all
  end

  def create
    province = Province.find(params[:province_id])

    if province&.valid?
    customer = province.customers.build(name: params[:name], email: params[:email], address: params[:address])
    customer.user = current_user
    customer.save
    logger.debug("****************#{customer.errors.messages} ")

    @sum = 0
    if customer&.valid?

      @customers = Customer.find(customer.id)
      session[:customer] = @customers.id
      quantity = 1
      if cart.present?
        cart.each do |product|
          @sum = @sum + (quantity * product.price.to_f)
          logger.debug("****************#{@sum} ")
        end
        @sum=  @sum.round(2) + @sum.round(2) * ((province.gst.to_f + province.pst.to_f)/100).to_d
        logger.debug("****************#{@sum} ")
        order = customer.orders.create(totalamount: @sum, status: "Pending")
        cart.each do |product|

           ProductOrder.create(product: product, order: order)
        end
      end
    end
  end
    redirect_to order_invoice_path
  end
  def invoice
    if current_user
      logger.debug("****************#{current_user.id} ")
      @customer = Customer.last
      logger.debug("****************#{@customer}****** ")
      # @customer.orders.each do |order|
      #   order.product_orders.each do |product_order|
      #   end
      # end
      end

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


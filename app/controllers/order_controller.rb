class OrderController < ApplicationController
  def index
    @provinces = Province.all
  end
  def invoice
    session[:name] = params[:name]
    session[:email] = params[:email]
    session[:address] = params[:address]
    @province = Province.find(params[:province_id])
    logger.debug("#{params[:name]} ")
  end
end

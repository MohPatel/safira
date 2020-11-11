class WelcomeController < ApplicationController
  def index
    @categories = Category.all.page(params[:page])
  end
  def about

  end
end

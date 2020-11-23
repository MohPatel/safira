class WelcomeController < ApplicationController
  add_breadcrumb "home", :root_path


  def index
    @categories = Category.all.page(params[:page])
  end
  def about
    add_breadcrumb "about", :welcome_about_path
    @about = About.first
  end
  def contact
    add_breadcrumb "Contact", :welcome_contact_path
    @contact = Contact.first
  end
end

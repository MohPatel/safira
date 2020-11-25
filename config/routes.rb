Rails.application.routes.draw do
  get 'order/index'
  get 'product/index'
  get 'category/index'
  get 'welcome/index'
  get 'welcome/contact'
  get 'product/index'
  get 'product/show'
  get 'product/filter'
  get 'welcome/about'
  get 'cart/show'

  get 'order/invoice'
  root 'product#index'

resources :product

  resources :category, only: %i[index show] do
    collection do
      get "search"
    end
  end
  resources :order, only: %i[create index]
  resources :cart, only: %i[create destroy]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

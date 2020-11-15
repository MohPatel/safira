Rails.application.routes.draw do
  get 'product/index'
  get 'category/index'
  get 'welcome/index'
  get 'product/index'
  get 'product/show'
  get 'product/filter'
  get 'welcome/about'
  root 'welcome#index'
  resources :product

  resources :product do
    post 'filter', on: :collection
  end

  resources :category, only: %i[index show] do
    collection do
      get "search"
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'category/index'
  get 'welcome/index'
  get 'welcome/about'
  root 'welcome#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  namespace :admin do
    get 'homes/top'
    resources :genres,only: [:index,:show,:edit,:create,:update]
    resources :orders,only: [:index,:show,:update]
    patch 'order_products' #制作ステータスのところです。
    resources :end_users,only: [:index,:show,:edit,:update]
    resources :products
  end

  root 'homes#top'
  resources :orders,only: [:index,:show,:new,:create,]
  post 'orders/confirm'
  get 'orders/complete'
  resources :cart_products,only: [:index,:edit,:update,:destroy]
  post 'cart_products/add_product'
  delete 'cart_products/destroy_all'
  resources :products,only: [:index,:show]
  resources :addresses
  devise_for :end_users
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do


   devise_for :end_users,controllers: {
    sessions: 'end_users/sessions',
    passwords: 'end_users/passwords',
    registrations: 'end_users/registrations'
  }

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

    namespace :admin do

    get 'homes/top'

    resources :genres,only: [:index,:edit,:create,:update,:destroy]
    resources :orders,only: [:index,:show,:update]
    resources :end_users,only: [:index,:show,:edit,:update]
    resources :products
  end

  root 'homes#top'
  get 'homes/about'
  post 'cart_products/add_product'
  delete 'cart_products/destroy_all'
  get "end_users/edit_info" => "end_users#edit", as: "edit_end_user"
  patch "end_users/info" => "end_users#update", as: "end_user_update"
  get 'end_users/unsubscribed'
  patch 'end_users/withdraw'
  get 'products/cake'
  get 'products/candy'
  get 'products/bakedgoods'
  get 'products/pudding'
  resources :products,only: [:index,:show,:create]
  resources :addresses
  resource :end_users, only: [:show,:update,:edit]
  resource :passwords, only: [:create,:update]
  resources :orders,only: [:index,:show,:new,:create] do
    collection do
    get :confirm
    get :complete
 end
end

  resources :cart_products do
    collection do
      delete "destroy_all"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
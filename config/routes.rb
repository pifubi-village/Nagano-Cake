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
    patch 'order_products' #制作ステータスのところです。
    resources :end_users,only: [:index,:show,:edit,:update]
    resources :products
  end

  root 'homes#top'
  post 'cart_products/add_product'
  delete 'cart_products/destroy_all'
  get "genre/:product_id/cakes" => "genres#cakes", as:'product_cakes'
  get "genre/:product_id/bakedgoods" => "genres#bakedgoods", as:'product_bakedgoods'
  get "genre/:product_id/candys" => "genres#candys", as:'product_candys'
  get "genre/:product_id/puddings" => "genres#puddings", as:'product_puddings'
  get "end_users/edit_info" => "end_users#edit", as: "edit_end_user"
  patch "end_users/info" => "end_users#update", as: "end_user_update"
  get 'end_users/unsubscribed'
  patch 'end_users/withdraw'

  resources :products,only: [:index,:show,:create]
  resources :addresses
  resource :end_users, only: [:show,:update,:edit]

  resources :orders,only: [:index,:show,:new,:create,] do
    collection do
    get :confirm
    post :complete
 end
end

  resources :cart_products do
    collection do
      delete "destroy_all"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
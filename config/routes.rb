Rails.application.routes.draw do
  devise_for :users
  root to: 'beverages#index'
  get 'about', to: 'pages#about', as: 'about'

  resources :beverages, only: %i[index show]

  get 'beverages/:id/buy', to: "beverages#buy", as: 'beverages_buy'
  post 'beverages/:id/finalize', to: "beverages#finalize", as: 'beverages_finalize'
  get 'orders/:id/finalize', to: "beverages#seller", as: 'beverages_seller'

  get 'become_seller', to: "users#become_seller", as: 'become_seller'
  patch 'update_user', to: "users#update_user", as: 'update_user'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :dashboard do
    resources :beverages
    resources :orders, only: %i[show destroy]
    post 'get_categories', to: "beverages#get_categories", as: "get_categories"
    patch 'orders/:id/shipped', to:"orders#ship_order", as: "ship_order"
    patch 'orders/:id/delivered', to:'orders#delivered', as: 'delivered_order'
  end


end

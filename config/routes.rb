Rails.application.routes.draw do
  devise_for :users
  root to: 'beverages#index'
  resources :beverages, only: %i[index show]

  get 'beverages/:id/buy', to: "beverages#buy", as: 'beverages_buy'
  post 'beverages/:id/finalize', to: "beverages#finalize", as: 'beverages_finalize'
  get 'orders/:id', to: "beverages#seller", as: 'beverages_seller'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :dashboard do
    resources :beverages
  end
end

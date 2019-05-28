Rails.application.routes.draw do
  devise_for :users
  root to: 'beverages#index'
  resources :beverages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

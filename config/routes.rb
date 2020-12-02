Rails.application.routes.draw do

  root to:"items#index"
  devise_for :users
  resources :items, only: [:index, :new, :create, :show]
  resources :item_purchases, only: [:index, :create]
 
end

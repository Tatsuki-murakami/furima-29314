Rails.application.routes.draw do

  get 'items', to: 'items#index'
  resources :items, only: [:index, :new,]

  devise_for :users
  
end

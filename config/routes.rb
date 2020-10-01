Rails.application.routes.draw do

  get 'items', to: 'items#index'

  devise_for :users
  
end

Rails.application.routes.draw do
 
  get 'users/show'
  devise_for :users
  root to: "rooms#index"
  resources :rooms, only: [:index,:new, :create]
  resources :users, only: :show
end

Rails.application.routes.draw do
 
  get 'users/show'
  devise_for :users
  root to: "rooms#index"
  resources :rooms, only: [:index,:new, :create, :show] do
    resources :messages, only: [:index, :create]
    resources :applies, only:[:index,:create,:destroy]
    resources :room_users, only:[:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end

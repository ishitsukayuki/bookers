Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#index'
  resources :homes, only: [:index]
  match '/about', to: 'homes#about', via: 'get'
  resources :books
  resources :users, only: [:index, :show, :edit, :update]
end

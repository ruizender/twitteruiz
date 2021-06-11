Rails.application.routes.draw do
  resources :tweets
  resources :likes
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # post 'likes'
  root 'home#index'
end

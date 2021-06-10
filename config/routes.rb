Rails.application.routes.draw do
  resources :tweets
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # post 'likes'
  root 'home#index'
end

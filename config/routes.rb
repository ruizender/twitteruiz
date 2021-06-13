Rails.application.routes.draw do
  resources :tweets do 
    member do
      post "retweet"
    end
  end
  resources :likes
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # post 'likes'
  root 'home#index'
end

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  
  namespace :api do
    namespace :v1 do
      get "/news", to: "news#news"
      get "/:fecha1/:fecha2", to: "news#limit"
      post "/tweet_from_api", to: "news#tweet_from_api"
        end
  end
  
  root 'home#index'
  
  resources :tweets do 
    member do
      post "retweet"
    end
  end
  resources :likes
  get "users", to: 'home#list_users', as:'list_users'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  post 'friends/:id', to: 'friends#create', as:'follow_friends'
  delete 'friends/:id', to: 'friends#destroy', as:'unfollow_friends'
end

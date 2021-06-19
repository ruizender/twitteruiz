Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :tweets do 
    member do
      post "retweet"
    end
  end
  resources :likes
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  root 'home#index'

  post 'friends/:id', to: 'friends#create', as:'follow_friends'
  delete 'friends/:id', to: 'friends#destroy', as:'unfollow_friends'

end

Rails.application.routes.draw do

root to: 'posts#index'

# root to: 'users#index', via: :get
get 'auth/login' => 'users#index'
get 'auth/facebook', as: 'auth_provider'
get 'auth/facebook/callback', to: 'users#login'



get '/login' => 'admin/sessions#new'
get '/logout' => 'admin/sessions#destroy'

  namespace :admin do
    resources :posts
    resources :settings, only: [:new, :create, :edit, :update]
    resources :dashboard, only: [:index]
    resources :moderators, only: [:index, :edit, :update]
    resources :notifications, only: [:index, :destroy]
    resources :messages, only: [:index, :show, :update, :destroy]
    resources :visitors, only: [:index, :destroy]
    resources :tags, except: [:index]
    resources :comments, only: [:index, :update, :destroy]
    resources :sessions, only: [:new, :create, :destroy]

end

  resources :posts, only: [:index, :show]
  resources :messages, only: [:new, :create]
  resources :comments, only: [:create]
  resources :about, only: [:index]
  resources :userposts


match 'dismiss_all_notifications', to: 'admin/notifications#delete_all', via: :delete



end

Uwbooks::Application.routes.draw do
  root :to => "books#index"

  resources :books

  resources :user_sessions, :only => [:new, :create, :destroy]
  get '/login' => 'user_sessions#new', :as => :login
  get '/logout' => 'user_sessions#destroy', :as => :logout
end

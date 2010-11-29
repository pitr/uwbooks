Uwbooks::Application.routes.draw do
  root :to => "books#index"

  resources :books do
    get :mine, :on => :collection, :as => :my
  end

  post '/login' => 'user_sessions#create'
  get '/login' => 'user_sessions#new', :as => :login
  get '/logout' => 'user_sessions#destroy', :as => :logout
end

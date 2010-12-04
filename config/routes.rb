Uwbooks::Application.routes.draw do
  root :to => "books#index"

  resources :books do
    get :mine, :on => :collection, :as => :my
    put :remove, :on => :member
  end

  resource :users, :except => :destroy

  post '/login' => 'user_sessions#create'
  get '/login' => 'user_sessions#new', :as => :login
  get '/logout' => 'user_sessions#destroy', :as => :logout
end

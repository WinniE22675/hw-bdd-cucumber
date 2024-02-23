Rottenpotatoes::Application.routes.draw do

  get 'page/home'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # get  'auth/:provider/callback' => 'sessions#create'
  # get  'auth/failure' => 'sessions#failure'
  # get  'auth/twitter', :as => 'login'
  # post 'logout' => 'sessions#destroy'
  # get '/auth/:provider/callback' => 'sessions#create'
  # get '/signin' => 'sessions#new', :as => :signin
  # get '/signout' => 'sessions#destroy', :as => :signout
  # get '/auth/failure' => 'sessions#failure'

  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
end

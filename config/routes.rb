Micro::Application.routes.draw do

  resources :users do
    resources :photos, :only => [:new, :create, :destroy]
    resources :matches, :only => [:new, :create]
  end

  get '/search' => 'users#search'
  get '/search_results' => 'users#search_results'
  root to: 'users#new'
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  get '/help', to: 'users#help'
end

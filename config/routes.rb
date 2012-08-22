Micro::Application.routes.draw do

  resources :users do
    resources :photos, :only => [:new, :create, :destroy]
    resources :matches, :only => [:new, :create]
  end

  get '/search' => 'users#search'
  get '/search_results' => 'users#search_results'
  get '/favorites' => 'users#favorites'
  
  root to: 'welcome#home'
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  resources :sessions, only: [:new, :create, :destroy]
  get '/help', to: 'users#help'
end

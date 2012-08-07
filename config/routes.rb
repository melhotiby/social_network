Micro::Application.routes.draw do

  resources :users do
    resources :photos, :only => [:new, :create, :destroy]
    resources :matches, :only => [:new, :create]
  end

  root to: 'users#new'
end

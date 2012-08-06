Micro::Application.routes.draw do

  resources :users do
    resources :photos
  end

  root to: 'users#new'
end

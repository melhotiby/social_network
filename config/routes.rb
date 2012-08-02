Micro::Application.routes.draw do
  resource :users

  root to: 'welcome#index'
end

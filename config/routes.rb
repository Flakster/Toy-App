Rails.application.routes.draw do
  resources :microposts
  root 'users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
end

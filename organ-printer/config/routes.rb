Rails.application.routes.draw do
  resources :user_organs
  resources :users
  resources :requirements
  resources :components
  resources :organs

  get 'welcome', to: 'login#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'login', to: 'login#create'

  get '/users/:id/organs', to: 'users#organs', as: 'organs_for_user'
end

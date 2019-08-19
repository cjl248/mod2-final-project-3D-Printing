Rails.application.routes.draw do
  resources :user_organs
  resources :users
  resources :requirements
  resources :components
  resources :organs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/:id/organs', to: 'users#organs', as: 'organs_for_user'
end

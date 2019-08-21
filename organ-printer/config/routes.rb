Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #resources :user_organs, only: [:new, :create]

  resources :users, only: [:show, :create] do
    resources :user_organs, only: [:index, :show, :new, :create]
  end
  get '/register', to: 'users#new'

  #get '/users/:id/organs', to: 'users#organs', as: 'organs_for_user'

  get "/login", to: 'login#new'
  post "/login", to: 'login#create'

end

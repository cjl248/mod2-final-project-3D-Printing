Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #resources :user_organs, only: [:new, :create]

  resources :users, only: [:show, :new, :create, :edit, :update] do
    resources :user_organs, only: [:index, :new, :create]
  end
  resources :user_organs, only: [:show, :destroy]

  ## REGISTER ##
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  ## LOGIN ##
  get "/login", to: 'login#new'
  post "/login", to: 'login#create'
  delete '/logout', to: 'login#destroy'

end

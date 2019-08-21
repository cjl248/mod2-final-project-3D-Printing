Rails.application.routes.draw do

  resources :users, only: [:show, :new, :create, :edit, :update] do
    resources :user_organs, only: [:index, :new, :create]
  end
  resources :user_organs, only: [:show, :destroy]


  ## CUSTOM ROUTE FOR STORING A USER-ORGAN ##
  ## PUT or PATCH? ##
  put '/store', to:'users#store'
  put "/user_organs/:id/check", to:'user_organs#check'
  
  ## REGISTER ##
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  ## LOGIN ##
  get "/login", to: 'login#new'
  post "/login", to: 'login#create'
  delete '/logout', to: 'login#destroy'

end

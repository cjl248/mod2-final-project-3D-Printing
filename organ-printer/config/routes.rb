Rails.application.routes.draw do

  resources :users, only: [:show, :new, :create, :edit, :update] do
    resources :user_organs, only: [:index, :new, :create]
  end
  resources :user_organs, only: [:show, :destroy]

  get 'welcome', to: 'login#new'
  post 'login', to: 'login#create'

end

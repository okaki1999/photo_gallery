Rails.application.routes.draw do
  resources :photos, only: [:new, :create, :index,:destroy]
  resources :users, only: [:new, :create, :destroy]

  # ログインとログアウトに関するルーティング
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy' 

  root "photos#index"
end

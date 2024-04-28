Rails.application.routes.draw do
  # Photosのリソースに対するRESTfulなルーティング
  resources :photos, only: [:new, :create, :index, :destroy]

  # Usersのリソースに対するRESTfulなルーティング
  resources :users, only: [:new, :create, :destroy]

  # ログインとログアウトに関するルーティング
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy' 

  # ルートパスの定義
  root "photos#index"
end

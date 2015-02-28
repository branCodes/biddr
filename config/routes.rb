Rails.application.routes.draw do
  root 'auctions#new'
  
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/userbids' => 'bids#user_bids'

  resources :auctions do
    resources :bids
  end
end

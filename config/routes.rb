Rails.application.routes.draw do
  root 'auctions#new'
  resources :auctions
end

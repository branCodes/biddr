Rails.application.routes.draw do
  root 'auctions#new'
  resources :auctions do
    resources :bids
  end
end

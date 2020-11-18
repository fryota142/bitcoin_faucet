Rails.application.routes.draw do
  root to: 'faucet#index'
  post 'faucet', to: 'faucet#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

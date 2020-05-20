Rails.application.routes.draw do
  root to: 'home#index'
  get '/add-new-transaction', to: 'transactions#new', as: 'new_transaction'
  post '/add-new-transaction', to: 'transactions#create', as: 'transactions'
end

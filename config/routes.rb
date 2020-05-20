Rails.application.routes.draw do
  root to: 'home#index'
  get '/add-new-transaction', to: 'transactions#new', as: 'new_transaction'
end

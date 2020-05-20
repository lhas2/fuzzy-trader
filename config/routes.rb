Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'home#index'
  get '/add-new-transaction', to: 'transactions#new', as: 'new_transaction'
  post '/add-new-transaction', to: 'transactions#create', as: 'transactions'
  get '/wallet', to: 'wallets#show', as: 'show_wallet'
end

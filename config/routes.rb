Rails.application.routes.draw do
  root 'store#index'

  post 'orders/add_item', 'orders#add_item'
  get 'orders/show', 'orders#show'
  get 'orders/checkout', 'orders#checkout'
  patch 'orders/update', 'orders#update'

  resources :order_items, only: [:edit, :update, :destroy]
  resources :invoices, only: [:show]
end

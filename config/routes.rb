Rails.application.routes.draw do
  root 'store#index'

  post 'orders/add_item', 'orders#add_item'
  get 'orders/show', 'orders#show'
end

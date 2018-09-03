Rails.application.routes.draw do
  root 'store#index'

  post 'orders/add_item', 'orders#add_item'
end

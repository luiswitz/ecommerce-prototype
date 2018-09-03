class ApplicationController < ActionController::Base
  helper_method :current_order

  private

  def current_order
    if session[:order_id]
      return Order.find(session[:order_id])
    end

    order = Order.create
    session[:order_id] = order.id
    order
  end
end

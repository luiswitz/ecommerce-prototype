class ApplicationController < ActionController::Base
  helper_method :current_order

  private

  def current_order
    if session[:order_id]
      order = Order.find_by(id: session[:order_id], status: :in_progress)

      if order
        return order
      end
    end

    order = Order.create
    session[:order_id] = order.id
    order
  end

  def handle_ar_messages(ar_object)
    handler = Handlers::ActiveRecordMessageHandler.new
    handler.handle(ar_object)
  end
end

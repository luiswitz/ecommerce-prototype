module Endpoints
  module Orders
    class UpdateEndpoint
      def perform(params)
        order = Order.find(params[:id])

        order.name = params[:name]
        order.email = params[:email]
        order.address = params[:address]
        order.shipping_mode_id = params[:shipping_mode_id]

        order.save
        
        order
      end
    end
  end
end

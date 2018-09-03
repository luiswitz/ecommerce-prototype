module Endpoints
  module OrderItems
    class UpdateEndpoint
      def perform(params)
        order_item = OrderItem.find(params[:id])
        order_item.quantity = params[:quantity]
        order_item.save

        order_item
      end
    end
  end
end

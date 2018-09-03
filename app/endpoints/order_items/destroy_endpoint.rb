module Endpoints
  module OrderItems
    class DestroyEndpoint
      def perform(params)
        order_item = OrderItem.delete(params[:id])
      end
    end
  end
end

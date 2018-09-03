module Endpoints
  module Orders
    class AddProductToOrderEndpoint
      def perform(params)
        current_item = params[:order].order_items.find_by_product_id(params[:product_id])

        if current_item
          current_item.quantity = current_item.quantity + params[:quantity]
          current_item.save

          return current_item
        end

        current_item = OrderItem.create(
          order: params[:order],
          product_id: params[:product_id],
          quantity: params[:quantity]
        )

        current_item
      end
    end
  end
end

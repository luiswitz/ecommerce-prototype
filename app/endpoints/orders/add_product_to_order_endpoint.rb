module Endpoints
  module Orders
    class AddProductToOrderEndpoint
      def perform(params)
        current_item = params[:order].order_items.find_by_product_id(params[:product_id])

        if current_item
          current_item.quantity = current_item.quantity + params[:quantity]
          current_item.save
          return handle_message(current_item)
        end

        current_item = OrderItem.create(
          order: params[:order],
          product_id: params[:product_id],
          quantity: params[:quantity]
        )

        handle_message(current_item)
      end

      private

      def handle_message(order_item)
        message = 'Product added to your order'

        if order_item.errors.any?
          message = order_item.errors.full_messages.map do |message|
            message
          end.join(', ')
        end

        message
      end
    end
  end
end

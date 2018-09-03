class OrderItemsController < ApplicationController
  def edit
    @order_item = OrderItem.find(params[:id])
  end

  def update
    endpoint = Endpoints::OrderItems::UpdateEndpoint.new

    order_item = endpoint.perform(
      id: params[:id].to_i,
      quantity: params[:quantity].to_i
    )

    redirect_to orders_show_path, notice: handle_ar_messages(order_item)
  end

  def destroy
    endpoint = Endpoints::OrderItems::DestroyEndpoint.new

    order_item = endpoint.perform(id: params[:id].to_i) 

    redirect_to orders_show_path
  end
end

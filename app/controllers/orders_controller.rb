class OrdersController < ApplicationController
  def show
    @order = current_order
  end

  def add_item
    endpoint = Endpoints::Orders::AddProductToOrderEndpoint.new

    order = endpoint.perform(
      order: current_order,
      product_id: params[:product_id].to_i,
      quantity: params[:quantity].to_i
    )

    redirect_to root_path, notice: handle_ar_messages(order)
  end
end

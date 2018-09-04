class OrdersController < ApplicationController
  def show
    @order = current_order
  end

  def checkout
    @order = current_order
  end

  def update
    endpoint = Endpoints::Orders::UpdateEndpoint.new

    order = endpoint.perform(
      id: current_order.id,
      name: params[:name],
      email: params[:email],
      address: params[:address],
      shipping_mode_id: params[:shipping_mode_id].to_i,
      status: :ordered
    )

    redirect_to invoice_path(order.id), notice: handle_ar_messages(order)
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

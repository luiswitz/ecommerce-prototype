class InvoicesController < ApplicationController
  def show
    @order = Order.find(params[:id])

    if @order.in_progress?
      redirect_to orders_show_path
    end
  end
end

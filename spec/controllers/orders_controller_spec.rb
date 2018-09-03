require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe 'POST #add_item' do
    let(:add_product_endpoint) do
      Endpoints::Orders::AddProductToOrderEndpoint
    end

    let(:current_order) { double(:order) }

    let(:params) do
      {
        order: current_order,
        product_id: 1,
        quantity: 10
      }
    end

    let(:order_item) do
      FactoryBot.create(:order_item)
    end

    before do
      allow_any_instance_of(add_product_endpoint)
        .to receive(:perform)
        .with(order: current_order, product_id: 1, quantity: 10)
        .and_return(order_item)

      allow_any_instance_of(ApplicationController)
        .to receive(:current_order)
        .and_return(current_order)
    end

    it 'adds an item to the current order' do
      expect_any_instance_of(add_product_endpoint)
        .to receive(:perform)
        .with(order: current_order, product_id: 1, quantity: 10)

      post :add_item, params: params
    end

    it 'redirects with a message' do
      post :add_item, params: params

      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to be_present
    end
  end
end

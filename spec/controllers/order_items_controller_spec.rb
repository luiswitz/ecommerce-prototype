require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
  let(:update_endpoint) do
    Endpoints::OrderItems::UpdateEndpoint
  end

  let(:params) do
    { id: 1 }
  end

  describe '#edit' do
    it 'responds successfully' do
      get :edit, params: params

      expect(response).to be_successful
    end
  end

  describe '#update' do
    let(:params) do
      {
        id: 1,
        quantity: 10
      }
    end

    before do
      allow_any_instance_of(update_endpoint)
        .to receive(:perform)
        .with(:params)
    end

    it 'delegates to update endpoint' do
      expect_any_instance_of(update_endpoint)
        .to receive(:perform)
        .with(params)

      patch :update, params: params
    end

    it 'redirects to the current order' do
      patch :update, params: params

      expect(response).to redirect_to(orders_show_path)
    end
  end
end

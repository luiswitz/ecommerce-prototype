require 'rails_helper'

RSpec.describe Endpoints::OrderItems::UpdateEndpoint do
  subject do
    described_class.new
  end

  let(:perform) do
    subject.perform(params)
  end

  let(:params) do
    {
      id: order_item.id,
      quantity: 10
    }
  end

  let(:order_item) do
    FactoryBot.create(:order_item, quantity: 1)
  end

  describe '#perform' do
    it 'updates an order item' do
      perform

      order_item.reload

      expect(order_item.quantity).to eq(10)
    end
  end
end

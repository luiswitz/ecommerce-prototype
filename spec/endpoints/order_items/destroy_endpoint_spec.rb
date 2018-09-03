require 'rails_helper'

RSpec.describe Endpoints::OrderItems::DestroyEndpoint do
  subject do
    described_class.new
  end

  let(:params) do
    { id: order_item.id }
  end

  let(:perform) { subject.perform(params) }

  let(:order_item) { FactoryBot.create(:order_item) }

  describe '#perform' do
    it 'deletes an order item' do
      perform

      expect(OrderItem.find_by_id(order_item.id)).to eq(nil)
    end
  end
end

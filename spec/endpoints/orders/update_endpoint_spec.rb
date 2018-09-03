require 'rails_helper'

RSpec.describe Endpoints::Orders::UpdateEndpoint do
  subject do
    described_class.new
  end

  let(:perform) do
    subject.perform(params)
  end

  let(:params) do
    {
      id: current_order.id,
      name: 'the-name',
      email: 'the-email',
      address: 'the-address',
      shipping_mode_id: shipping_mode.id
    }
  end

  let(:current_order) do
    FactoryBot.create(:order)
  end

  let(:shipping_mode) do
    FactoryBot.create(:shipping_mode)
  end

  describe '#perform' do
    it 'updates an order' do
      perform

      current_order.reload

      expect(current_order.name).to eq('the-name')
      expect(current_order.email).to eq('the-email')
      expect(current_order.address).to eq('the-address')
      expect(current_order.shipping_mode_id).to eq(shipping_mode.id)
    end
  end
end

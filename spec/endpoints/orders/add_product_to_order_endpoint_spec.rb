require 'rails_helper'

RSpec.describe Endpoints::Orders::AddProductToOrderEndpoint do
  subject do
    described_class.new
  end

  let(:perform) do
    subject.perform(params)
  end

  let(:params) do
    {
      order: order,
      product_id: product.id,
      quantity: quantity
    }
  end

  let(:order) do
    FactoryBot.create(:order)
  end

  let(:product) do
    FactoryBot.create(:product)
  end

  describe '#perform' do
    context 'with right parameters' do
      let(:quantity) { 1 }

      context 'a new item' do
        it 'adds an item to an order' do
          perform

          expect(order.order_items.first.order_id).to eq(order.id)
          expect(order.order_items.first.product_id).to eq(product.id)
          expect(order.order_items.first.quantity).to eq(1)
        end
      end

      context 'an existent item' do
        it 'updates the quantity field' do
          perform

          order_item = order.order_items.first

          subject.perform(
            order: order_item.order,
            product_id: order_item.product_id,
            quantity: order_item.quantity
          )

          expect(order.order_items.first.order_id).to eq(order.id)
          expect(order.order_items.first.product_id).to eq(product.id)
          expect(order.order_items.first.quantity).to eq(2)
        end
      end
    end
  end
end

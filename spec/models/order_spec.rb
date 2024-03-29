require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) do
    FactoryBot.create(:order)
  end

  before do
    product_1 = FactoryBot.create(:product, price: 10)
    product_2 = FactoryBot.create(:product, price: 10)

    OrderItem.create(order: order, product: product_1, quantity: 1)
    OrderItem.create(order: order, product: product_2, quantity: 10)
  end

  describe 'validations' do
    context 'an invalid order' do
      it 'is not valid without a name' do
        order.name = nil

        expect(order).to_not be_valid
      end

      it 'is not valid without an email' do
        order.email = nil

        expect(order).to_not be_valid
      end

      it 'is not valid without an address' do
        order.address = nil

        expect(order).to_not be_valid
      end

      it 'is not valid without a shipping_mode' do
        order.shipping_mode = nil

        expect(order).to_not be_valid
      end
    end

    context 'a valid order' do
      it 'is valid with all attributes' do
        expect(order).to be_valid
      end
    end
  end

  describe 'relationships' do
    it 'belongs to a shipping_mode' do
      association = described_class.reflect_on_association(:shipping_mode)

      expect(association.macro).to eq(:belongs_to)
    end

    it 'has many order_items' do
      association = described_class.reflect_on_association(:order_items)

      expect(association.macro).to eq(:has_many)
    end

    it 'has many product through order items' do
      association = described_class.reflect_on_association(:products)

      expect(association.macro).to eq(:has_many)
    end
  end

  describe '#total_products_price' do

    it 'returns the total price of the order' do
      expect(order.total_products_price).to eq(110)
    end
  end

  describe '#total_tax' do
    it 'returns tax value' do
      expect(order.total_tax).to eq(1.43)
    end
  end

  describe '#total_price' do
    it 'returns the final price of order' do
      expected_total = order.shipping_mode.price + 111.43

      expect(order.total_price).to eq(expected_total)
    end
  end
end

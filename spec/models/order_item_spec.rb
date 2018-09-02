require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  let(:order_item) do
    FactoryBot.create(:order_item)
  end

  describe 'validations' do
    context 'an invalid oder_item' do
      it 'is not valid without a order' do
        order_item.order = nil

        expect(order_item).to_not be_valid
      end

      it 'is not valid without a product' do
        order_item.product = nil

        expect(order_item).to_not be_valid
      end

      it 'is not valid withou a quantity' do
        order_item.quantity = nil

        expect(order_item).to_not be_valid
      end

      it 'is not valid with a quantity less than 1' do
        order_item.quantity = 0

        expect(order_item).to_not be_valid
      end
    end

    context 'a valid order_item' do
      it 'is valid with all attributes filled' do
        expect(order_item).to be_valid
      end
    end
  end

  describe 'relationships' do
    it 'belongs to an order' do
      association = described_class.reflect_on_association(:order)

      expect(association.macro).to eq(:belongs_to)
    end

    it 'belongs to a product' do
      association = described_class.reflect_on_association(:product)

      expect(association.macro).to eq(:belongs_to)
    end
  end
end

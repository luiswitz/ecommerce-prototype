require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) do
    FactoryBot.create(:order)
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
  end
end

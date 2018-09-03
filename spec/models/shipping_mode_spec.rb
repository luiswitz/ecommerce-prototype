require 'rails_helper'

RSpec.describe ShippingMode, type: :model do
  let(:regular_shipping) { FactoryBot.create(:shipping_mode) }
  
  describe 'validations' do
    context 'with invalid attributes' do
      let(:duplicated_shipping) do
        FactoryBot.create(:shipping_mode, title: regular_shipping.title)
      end

      it 'is not valid without a title' do
        regular_shipping.title = ''

        expect(regular_shipping).to_not be_valid
      end

      it 'is not valid with a duplicated title' do
        expect { duplicated_shipping }.to raise_error do |error|
          expect(error.message).to match(/Title has already been taken/)
        end
      end

      it 'is not valid without a price' do
        regular_shipping.price = nil

        expect(regular_shipping).to_not be_valid
      end

      it 'is not valid with a negative price' do
        regular_shipping.price = -1.0

        expect(regular_shipping).to_not be_valid
      end
    end
  end

  describe 'relationships' do
    it 'has many orders' do
      association = described_class.reflect_on_association(:orders)

      expect(association.macro).to eq(:has_many)
    end
  end
end

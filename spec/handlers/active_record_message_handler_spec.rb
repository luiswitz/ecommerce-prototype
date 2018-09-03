require 'rails_helper'

RSpec.describe Handlers::ActiveRecordMessageHandler do
  subject do
    described_class.new
  end

  let(:handle) { subject.handle(product) }

  let(:product) do
    FactoryBot.build(:product)
  end

  describe '#handle' do
    context 'success handling' do
      it 'returns a success message' do
        product.save!

        expect(handle).to eq('Product was saved successfully')
      end
    end

    context 'error handling' do
      it 'returns all error messages' do
        product.title = nil

        expect { product.save! }.to raise_error do |error|
          expect(error).to be_a(ActiveRecord::RecordInvalid)
        end

        expect(handle).to match(/Title can't be blank/)
      end
    end
  end
end

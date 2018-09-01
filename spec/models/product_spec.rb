require 'rails_helper'

RSpec.describe Product, type: :model do
  subject do
    described_class.new(
      title: 'the-title',
      description: 'the-description',
      price: 10.0,
      image_url: 'the-img-url'
    )
  end

  describe 'validations' do
    context 'an invalid product' do
      it 'is not valid without a title' do
        subject.title = ''
        expect(subject).to_not be_valid
      end

      it 'is not valid without a price' do
        subject.price = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid with a negative price' do
        subject.price = -1
        expect(subject).to_not be_valid
      end

      it 'must have a unique title' do
        another_product = subject.dup

        subject.save!

        expect { another_product.save! }.to raise_error do |error|
          expect(error.message).to match(/Title has already been taken/)
        end
      end
    end
  end
end

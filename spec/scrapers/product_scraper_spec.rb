require 'rails_helper'

RSpec.describe ProductScraper do
  subject { described_class.new(html) }

  let(:html) { File.read("#{fixture_path}/products.html") }

  let(:apple) do
    Product.new(
      title: 'Apple',
      description: 'apple desc',
      image_url: 'http://www.greatgrubclub.com/apple-img',
      price: 5.0
    )
  end

  let(:orange) do
    Product.new(
      title: 'Orange',
      description: 'orange desc',
      image_url: 'http://www.greatgrubclub.com/orange-img',
      price: 5.0
    )
  end

  let(:expected_products) do
    [apple, orange]
  end

  describe '#find_products' do
    before do
      allow_any_instance_of(Kernel)
        .to receive(:rand)
        .with(1..11)
        .and_return(5)
    end

    it 'returns an array of products' do
      expect(subject.find_products.to_json).to eq(expected_products.to_json)
    end
  end
end

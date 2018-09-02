require 'rails_helper'

RSpec.describe Endpoints::Products::IndexEndpoint do
  subject { described_class.new }

  let(:perform) do
    subject.perform(params)
  end

  let(:params) do
    {}
  end

  let(:page1) do
    FactoryBot.create_list(:product, 10)
  end

  let(:page2) do
    FactoryBot.create_list(:product, 10)
  end

  let(:products) do
    [page1, page2].flatten
  end

  describe '#perform' do
    before do
      products
    end
    
    context 'with empty params' do
      it 'returns the first page of records' do
        expect(perform).to eq(page1)
      end
    end

    context 'with page 2 param' do
      let(:params) do
        { page: 2 }
      end

      it 'returns second page records' do
        expect(perform).to eq(page2)
      end
    end
  end
end

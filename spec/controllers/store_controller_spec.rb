require 'rails_helper'

RSpec.describe StoreController, type: :controller do
  let(:products_index_endpoint) do
    Endpoints::Products::IndexEndpoint
  end

  let(:params) do
    { page: '1' }
  end

  describe 'GET #index' do
    before do
      allow_any_instance_of(products_index_endpoint).to receive(:perform)
        .with(page: 1)
    end

    it 'responds successfully' do
      get :index, params: params

      expect(response).to be_successful
    end

    it 'performs with products index endpoint' do
      expect_any_instance_of(products_index_endpoint).to receive(:perform)
        .with(page: 1)

      get :index, params: params
    end
  end
end

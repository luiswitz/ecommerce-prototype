require 'rails_helper'

RSpec.describe InvoicesController, type: :controller do
  let(:params) do
    { id: order.id }
  end

  let(:order) do
    FactoryBot.create(:order, status: :in_progress)
  end

  describe '#GET show' do
    before do
      get :show, params: params
    end

    context 'an in progress order' do
      it 'redirect to current order' do
        expect(response).to redirect_to(orders_show_path)
      end
    end

    context 'a finished order' do
      let(:order) do
        FactoryBot.create(:order, status: :ordered)
      end

      it 'responds successfully' do
        expect(response).to be_successful
      end
    end
  end
end

module Endpoints
  module Products
    class IndexEndpoint
      def perform(params)
        page = params[:page]

        Product.page(page).per(10)
      end
    end
  end
end

class StoreController < ApplicationController
  def index
    endpoint = Endpoints::Products::IndexEndpoint.new

    @products = endpoint.perform(page: params[:page].to_i)
  end
end

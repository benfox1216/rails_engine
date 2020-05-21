class Api::V1::Merchants::SearchController < ApplicationController
  # def index
  #   render json: SearchSerializer.new(Search.all)
  # end
  
  def show
    if Merchant.find_one(params)
      render json: MerchantSerializer.new(Merchant.find_one(params))
    else
      render json: {error: 'No results'}
    end
  end
end
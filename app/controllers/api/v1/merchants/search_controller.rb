class Api::V1::Merchants::SearchController < ApplicationController
  # def index
  #   render json: SearchSerializer.new(Search.all)
  # end
  
  def show
    test = Merchant.find_one(params)
    if test != nil
      render json: MerchantSerializer.new(test)
    else
      render json: {error: 'No results'}
    end
  end
end
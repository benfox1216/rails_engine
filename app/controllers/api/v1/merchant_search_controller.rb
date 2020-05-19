class Api::V1::MerchantSearchController < ApplicationController
  # def index
  #   render json: SearchSerializer.new(Search.all)
  # end
  
  def show
    binding.pry
    # results =
    render json: SearchSerializer.new(Search.find(params[:id]))
  end
end
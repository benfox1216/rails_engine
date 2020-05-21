class Api::V1::ItemsmerchantController < ApplicationController
  def show
    render json: MerchantSerializer.new(Item.find(params[:id]).merchant)
  end
  
  def index
    render json: ItemSerializer.new(Merchant.find(params[:id]).items)
  end
end
class Api::V1::ItemsmerchantController < ApplicationController
  def show
    merchant = Item.find(params[:id]).merchant
    render json: MerchantSerializer.new(merchant)
  end
  
  def index
    items = Merchant.find(params[:id]).items
    render json: ItemSerializer.new(items)
  end
end
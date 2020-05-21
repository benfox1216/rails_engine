class Api::V1::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all)
  end
  
  def show
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
  end
  
  def create
    merchant = Merchant.create(merchant_params)
    
    if merchant.save
      render json: MerchantSerializer.new(merchant)
    else
      render json: {error: 'No results'}
    end
  end
  
  def update
    merchant = Merchant.find(params[:id])
    merchant.update({name: params[:name]})
    render json: MerchantSerializer.new(merchant)
  end
  
  def destroy
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
    Merchant.destroy(params[:id])
  end
  
  private
  
  def merchant_params
    params.permit(:name)
  end
end
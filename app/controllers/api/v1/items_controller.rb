class Api::V1::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.all)
  end
  
  def show
    render json: ItemSerializer.new(Item.find(params[:id]))
  end
  
  def create
    item = Item.create(item_params)
    
    if item.save
      render json: ItemSerializer.new(item)
    else
      render json: {error: 'No results'}
    end
  end
  
  def update
    item = Item.find(params[:id])
    item.update({
      name: params[:name],
      description: params[:description],
      unit_price: params[:unit_price],
      merchant_id: params[:merchant_id]
      })
    render json: ItemSerializer.new(item)
  end
  
  def destroy
    render json: ItemSerializer.new(Item.find(params[:id]))
    Item.destroy(params[:id])
  end
  
  private
  
  def item_params
    params.permit(:name, :description, :unit_price, :merchant_id)
  end
end
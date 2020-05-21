class Api::V1::Items::SearchController < ApplicationController
  # def index
  #   render json: SearchSerializer.new(Search.all)
  # end
  
  def show
    if Item.find_one(params)
      render json: ItemSerializer.new(Item.find_one(params))
    else
      render json: {error: 'No results'}
    end
  end
end
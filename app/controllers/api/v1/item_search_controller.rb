class Api::V1::ItemSearchController < ApplicationController
  # def index
  #   render json: SearchSerializer.new(Search.all)
  # end
  
  def show
    render json: SearchSerializer.new(Search.find(params[:id]))
  end
end
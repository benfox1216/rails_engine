class Api::V1::RevenueController < ApplicationController
  def index
    render json: RevenueSerializer.new(InvoiceItem.revenue(params))
  end
end
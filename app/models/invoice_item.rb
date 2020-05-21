class InvoiceItem < ApplicationRecord
  has_and_belongs_to_many :item
  has_and_belongs_to_many :invoice
  has_many :transactions, through: :invoices
  
  def self.revenue(params)
    select(:unit_price)
    .where(params[:start_date] < updated_at, params[:end_date] > updated_at)
    .sum(:unit_price)
  end
  
  private
  
  def updated_at
    updated_at.to_s(format = :default).split(" ").first
  end
end

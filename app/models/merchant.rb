class Merchant < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  
  def self.find_one(params)
    Merchant.where("name ILIKE ?", "%#{params[:name]}%").first
  end
  
  def self.most_revenue(quantity)
    select('merchants.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue')
    .joins(:invoice_items, :transactions)
    .merge(Transaction.successful)
    .group(:id)
    .order("revenue DESC")
    .limit(quantity)
  end
end

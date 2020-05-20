class Merchant < ApplicationRecord
  has_many :items, dependent: :destroy
  
  def self.find_one(params)
    Merchant.where("name ILIKE ?", "%#{params[:name]}%").first
  end
end

class Item < ApplicationRecord
  belongs_to :merchant
  
  def self.find_one(params)
    Item.where("name ILIKE ?", "%#{params[:name]}%").first
  end
end

require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_successful
    expect(json[:data].count).to eq(3)
  end
  
  it "sends a single item" do
    item = create(:item)
    
    get "/api/v1/items/#{item.id}"
    
    expect(response).to be_successful
    expect(json[:data][:id]).to eq("#{item.id}")
  end
  
  it "can create and delete an item" do
    merchant = create(:merchant)
    item_params = {
      "name": "Thing",
      "description": "It's pretty cool",
      "unit_price": 95.95,
      "merchant_id": merchant.id
    }
    
    post '/api/v1/items', params: {description: item_params}
    expect(response).to be_successful
    
    new_item = {
                  "id": "#{Item.last.id}",
                  "type": "item",
                  "attributes": {
                    "name": "Thing",
                    "description": "It's pretty cool",
                    "unit_price": 95.95
                  }
                }
    
    expect(json[:data]).to eq(new_item)
    expect(Item.count).to eq(1)
    
    delete "/api/v1/items/#{new_item[:id]}"

    expect(response).to be_successful
    expect(Item.count).to eq(0)
    expect{Item.find(new_item[:id])}.to raise_error(ActiveRecord::RecordNotFound)
  end
  
  it "can delete an item and send back the item" do
    
  end
  
  it "can update an item and send back the item" do
    
  end
end
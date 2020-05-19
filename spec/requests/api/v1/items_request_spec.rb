require 'rails_helper'

describe "Items API" do
  # before :each do
  #
  # end
  
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
  
  it "sends a single item's merchant" do
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_successful
    expect(json[:data][:id]).to eq("#{merchant.id}")
  end
end
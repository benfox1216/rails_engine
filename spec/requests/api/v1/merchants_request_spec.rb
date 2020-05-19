require 'rails_helper'

describe "Merchants API" do
  # before :each do
  #
  # end
  
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful
    expect(json[:data].count).to eq(3)
  end
  
  it "sends a single merchant" do
    merchant = create(:merchant)
    
    get "/api/v1/merchants/#{merchant.id}"
    
    expect(response).to be_successful
    expect(json[:data][:id]).to eq("#{merchant.id}")
  end
  
  it "sends a list of all items associated with a merchant" do
    merchant = create(:merchant)
    create_list(:item, 3, merchant_id: merchant.id)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_successful
    expect(json[:data].count).to eq(3)
  end
end
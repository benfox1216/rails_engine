require 'rails_helper'

describe "Merchants API" do
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
  
  it "can create a merchant and send back the merchant" do
    
  end
  
  it "can delete a merchant and send back the merchant" do
    
  end
  
  it "can update a merchant and send back the merchant" do
    
  end
end